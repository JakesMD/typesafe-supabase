import 'package:typesafe_supabase/typesafe_supabase.dart';

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
  }) : super(
          queryPattern:
              '''$tableName${joinType != SupaJoinType.manyToMany ? ':${joiningColumn.name}' : ''}(*)''',
        );

  /// The name of the table to join.
  final String tableName;

  /// The column with the foreign key that joins the tables.
  final SupaColumn<B, dynamic, dynamic> joiningColumn;

  /// The type of join to perform.
  final SupaJoinType joinType;

  /// The constructor of the record type from the table to join.
  final SupaRecord<A> Function(Map<String, dynamic> json) record;

  /// Returns a [SupaColumnBase] with the correct query pattern to fetch the
  /// given columns from the joined table.
  SupaColumnBase<B> call(Set<SupaColumnBase<A>> columns) => SupaColumnBase<B>(
        queryPattern: columns.isNotEmpty
            ? '''$tableName${joinType != SupaJoinType.manyToMany ? ':${joiningColumn.name}' : ''}(${columns.map((c) => c.queryPattern).join(', ')})'''
            : queryPattern,
      );
}
