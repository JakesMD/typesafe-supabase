import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

class _Column {
  _Column({
    required this.name,
    required this.type,
    required this.hasDefault,
    required this.documentationComment,
  });

  final String name;
  final String type;
  final bool hasDefault;
  final String documentationComment;

  bool get isNullableOrHasDefault => type.endsWith('?') || hasDefault;
}

class _TableJoin {
  _TableJoin({
    required this.name,
    required this.tableName,
    required this.prefix,
    required this.documentationComment,
    required this.joinType,
  });

  final String name;
  final String tableName;
  final String prefix;
  final String documentationComment;
  final SupaJoinType joinType;
}

/// The generator that generates all the necessary classes for a [SupaTable].
class SupaTableGenerator extends GeneratorForAnnotation<SupaTableHere> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) return '';

    final prefix = _fetchPrefix(annotation, element);
    final columns = _fetchColumns(element);
    final tableJoins = _fetchTableJoins(element);

    return '''
// ignore_for_file: strict_raw_type
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file


/// The base class that links all classes for [${element.displayName}] together
/// to create full type safety.
base class ${prefix}Core extends SupaCore {}

/// {@template ${prefix}Record}
/// 
/// Represents a record fetched from [${element.displayName}].
/// 
/// {@endtemplate}
class ${prefix}Record extends SupaRecord<${prefix}Core> {
  /// {@macro ${prefix}Record}
  const ${prefix}Record(super.json);

  ${columns.map((c) => '  ${c.documentationComment.replaceAll('\n', '\n  ')}\n  ///\n  /// This will throw an exception if the column was not fetched.\n  ${c.type} get ${c.name} => call(${element.displayName}.${c.name});').join('\n  ')}

  ${tableJoins.where((j) => j.joinType != SupaJoinType.oneToOne).map((j) => '  ${j.documentationComment.replaceAll('\n', '\n  ')}\n  ///\n  /// This will throw an exception if no joined columns were fetched.\n  List<${j.prefix}Record> get ${j.name} => reference(${element.displayName}.${j.name});').join('\n  ')}

  ${tableJoins.where((j) => j.joinType == SupaJoinType.oneToOne).map((j) => '  ${j.documentationComment.replaceAll('\n', '\n  ')}\n  ///\n  /// This will throw an exception if no joined columns were fetched.\n  ${j.prefix}Record get ${j.name} => referenceSingle(${element.displayName}.${j.name});').join('\n  ')}
}

/// {@template ${prefix}Insert}
///
/// Represents an insert operation on [${element.displayName}].
///
/// {@endtemplate}
class ${prefix}Insert extends SupaInsert<${prefix}Core> {
  /// {@macro ${prefix}Insert}
  const ${prefix}Insert({
    ${columns.map((c) => '${!c.isNullableOrHasDefault ? 'required' : ''} this.${c.name},').join('\n    ')}
  });

  ${columns.map((c) => '  ${c.documentationComment.replaceAll('\n', '\n  ')}\n  final ${c.type}${c.hasDefault ? '?' : ''} ${c.name};').join('\n  ')}

  @override
  Set<SupaValue<${prefix}Core, dynamic, dynamic>> get values => {
        ${columns.map((c) => '${c.isNullableOrHasDefault ? 'if (${c.name} != null) ' : ''}${element.displayName}.${c.name}(${c.name}${c.hasDefault ? '!' : ''}),').join('\n          ')}
      };
}''';
  }

  String _fetchPrefix(ConstantReader annotation, ClassElement element) {
    return annotation.read('prefix').literalValue as String? ??
        element.displayName;
  }

  List<_Column> _fetchColumns(ClassElement element) {
    return element.fields
        .map(_fetchColumnFromField)
        .whereType<_Column>()
        .toList();
  }

  List<_TableJoin> _fetchTableJoins(ClassElement element) {
    return element.fields
        .map(_fetchTableJoinFromField)
        .whereType<_TableJoin>()
        .toList();
  }

  _Column? _fetchColumnFromField(FieldElement field) {
    if (!field.isStatic) return null;

    final annotation = field.metadata
        .where(
          (annotation) =>
              annotation
                  .computeConstantValue()
                  ?.type
                  ?.getDisplayString()
                  .contains(
                    'SupaColumnHere',
                  ) ??
              false,
        )
        .firstOrNull;

    if (annotation == null) return null;

    final annoValue = annotation.computeConstantValue()!;

    final hasDefault = annoValue.getField('hasDefault')?.toBoolValue() ?? false;

    final fullType = annoValue.type?.getDisplayString() ?? '<dynamic>';

    final type = fullType.substring(
      fullType.indexOf('<') + 1,
      fullType.lastIndexOf('>'),
    );

    return _Column(
      name: field.displayName,
      type: type,
      hasDefault: hasDefault,
      documentationComment:
          field.documentationComment ?? '/// No documentation found.',
    );
  }

  _TableJoin? _fetchTableJoinFromField(FieldElement field) {
    if (!field.isStatic) return null;

    final annotation = field.metadata
        .where(
          (annotation) =>
              annotation
                  .computeConstantValue()
                  ?.type
                  ?.getDisplayString()
                  .contains(
                    'SupaTableJoinHere',
                  ) ??
              false,
        )
        .firstOrNull;

    if (annotation == null) return null;

    final annoValue = annotation.computeConstantValue()!;

    final tableName = annoValue.getField('tableName')!.toStringValue()!;

    final prefix = annoValue.getField('prefix')!.toStringValue()!;

    final joinTypeString = annoValue.getField('joinType')!.toString();
    late SupaJoinType joinType;

    switch (joinTypeString) {
      case "SupaJoinType (_name = String ('oneToOne'); index = int (0))":
        joinType = SupaJoinType.oneToOne;

      case "SupaJoinType (_name = String ('oneToMany'); index = int (1))":
        joinType = SupaJoinType.oneToMany;

      case "SupaJoinType (_name = String ('manyToMany'); index = int (2))":
        joinType = SupaJoinType.manyToMany;
    }

    return _TableJoin(
      name: field.displayName,
      tableName: tableName,
      prefix: prefix,
      documentationComment:
          field.documentationComment ?? '/// No documentation found.',
      joinType: joinType,
    );
  }
}
