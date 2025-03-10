import 'package:typesafe_supabase/typesafe_supabase.dart';

String _generateQueryPatternPrefix<B extends SupaCore>(
  String tableName,
  SupaColumn<B, dynamic, dynamic> joiningColumn,
  SupaJoinType joinType,
  String? foreignKey,
) {
  var secondPart = '';

  if (foreignKey != null) {
    secondPart = '!$foreignKey';
  } else if (joinType != SupaJoinType.manyToMany) {
    secondPart = ':${joiningColumn.name}';
  }

  return '''$tableName$secondPart''';
}

/// {@template SupaTableJoin}
///
/// Represents a join between two tables in the Supabase database.
///
/// {@endtemplate}
class SupaTableJoin<B extends SupaCore, A extends SupaCore>
    extends SupaColumnBase<B> {
  /// {@macro SupaTableJoin}
  SupaTableJoin({
    required this.tableName,
    required this.joiningColumn,
    required this.joinType,
    required this.record,
    this.foreignKey,
  }) : super(
          queryPattern:
              '''${_generateQueryPatternPrefix(tableName, joiningColumn, joinType, foreignKey)}(*)''',
        );

  /// The name of the table to join.
  final String tableName;

  /// The column with the foreign key that joins the tables.
  final SupaColumn<B, dynamic, dynamic> joiningColumn;

  /// The type of join to perform.
  final SupaJoinType joinType;

  /// The constructor of the record type from the table to join.
  final SupaRecord<A> Function(Map<String, dynamic> json) record;

  /// The foreign key to use in the join.
  ///
  /// This is required when more than one relationship exists.
  ///
  /// ### Example
  ///
  /// You may encounter an error like this:
  ///
  /// ``` shell
  /// PostgrestException(
  ///   message: Could not embed because more than one relationship was found
  ///            for 'author' and 'id',
  ///   code: PGRST201,
  ///   details: [
  ///     {
  ///       cardinality: one-to-many,
  ///       embedding: authors with books,
  ///       relationship: book_author_id_fkey using authors(id) and
  ///                     books(author_id)
  ///     },
  ///     {
  ///       cardinality: one-to-many,
  ///       embedding: authors with author_avatar_urls,
  ///       relationship: author_avatar_urls_author_id_fkey using
  ///                     authors(id) and author_avatar_urls(author_id)
  ///     }
  ///   ],
  ///   hint: Try changing 'id' to one of the following:
  ///         'books!books_author_id_fkey',
  ///         'author_avatar_urls!author_avatar_urls_author_id_fkey'.
  ///         Find the desired relationship in the 'details' key.
  /// )
  /// ```
  ///
  /// In this case, you would set `foreignKey` to
  /// `'books_author_id_fkey'`.
  final String? foreignKey;

  /// Returns a [SupaColumnBase] with the correct query pattern to fetch the
  /// given columns from the joined table.
  SupaColumnBase<B> call(Set<SupaColumnBase<A>> columns) => SupaColumnBase<B>(
        queryPattern: columns.isNotEmpty
            ? '''${_generateQueryPatternPrefix(tableName, joiningColumn, joinType, foreignKey)}(${columns.map((c) => c.queryPattern).join(', ')})'''
            : queryPattern,
      );

  /// Creates a [SupaValue] with the correct name for fetching the given value
  /// from the joined table.
  SupaValue<B, T, J> value<T, J>(SupaValue<A, T, J> value) => SupaValue(
        name: '$tableName.${value.name}',
        value: value.value,
        valueToJSON: value.valueToJSON,
        valueFromJSON: value.valueFromJSON,
      );
}
