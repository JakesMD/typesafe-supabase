import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

class _Column {
  _Column({
    required this.name,
    required this.type,
    required this.hasDefault,
    this.documentationComment = '',
  });

  final String name;
  final String type;
  final bool hasDefault;
  final String documentationComment;

  bool get isNullableOrHasDefault => type.endsWith('?') || hasDefault;
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

    return '''
// ignore_for_file: strict_raw_type
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file


/// The base class that links all classes for [${element.displayName}] together
/// to create full type safety.
class ${prefix}Core extends SupaCore {}

/// Represents a record fetched from [${element.displayName}].
class ${prefix}Record extends SupaRecord<${prefix}Core> {
  const ${prefix}Record._(super.json);

  ${columns.map((c) => '  ${c.documentationComment.replaceAll('\n', '\n  ')}\n  ///\n  /// This will throw an exception if the column was not fetched.\n  ${c.type} get ${c.name} => call(${element.displayName}.${c.name});').join('\n  ')}
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

    final hasDefault = annotation
            .computeConstantValue()!
            .getField('hasDefault')
            ?.toBoolValue() ??
        false;

    final fullType =
        annotation.computeConstantValue()!.type?.getDisplayString() ??
            '<dynamic>';

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
}
