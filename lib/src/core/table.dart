import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/src/filter/filter.dart';
import 'package:typesafe_supabase/src/modifier/modifier.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaTable}
///
/// Represents a table in the Supabase database.
///
/// {@endtemplate}
class SupaTable<B extends SupaCore, R extends SupaRecord<B>>
    with SupaFilterMixin<B>, SupaModifierMixin<B, R> {
  /// {@macro SupaTable}
  const SupaTable(
    this.recordFromJSON, {
    required this.tableName,
    required this.primaryKey,
    required this.supabaseClient,
    this.schema = 'public',
  });

  /// The name of the table.
  final String tableName;

  /// The primary key of the table.
  final String primaryKey;

  /// The schema of the table. Defaults to `public`.
  final String schema;

  /// The client instance used to interact with supabase.
  final SupabaseClient supabaseClient;

  /// Converts a JSON map to a record.
  final R Function(Map<String, dynamic> json) recordFromJSON;

  /// Fetches records from the Supabase table.
  ///
  /// [columns] is the set of columns to fetch. If null, all columns are
  /// fetched.
  /// [filter] is the filter to apply to the query.
  Future<T> fetch<T>({
    required SupaFilter<B> filter,
    required SupaModifier<B, R, T, dynamic, dynamic> modifier,
    Set<SupaColumnBase<B>>? columns,
  }) async {
    final response = await supabaseClient
        .schema(schema)
        .from(tableName)
        .select(columns?.map((c) => c.queryPattern).join(', ') ?? '*')
        .supaApplyFilter(filter)
        .supaApplyModifier(modifier);

    if (modifier
        is SupaModifier<B, R, List<R>, List<Map<String, dynamic>>, dynamic>) {
      return (response as List<Map<String, dynamic>>)
          .map(recordFromJSON)
          .toList() as T;
    } else if (modifier
        is SupaModifier<B, R, R, Map<String, dynamic>, dynamic>) {
      return recordFromJSON(response as Map<String, dynamic>) as T;
    }
    return response as T;
  }

  /// Inserts records into the Supabase table.
  ///
  /// [records] is the list of records to insert.
  Future<void> insert({
    required List<SupaInsert<B>> records,
  }) =>
      supabaseClient
          .schema(schema)
          .from(tableName)
          .insert(records.map((r) => r.toJSON()).toList());

  /// Updates records in the Supabase table.
  ///
  /// [values] is the set of values to update.
  /// [filter] is the filter to apply to the query.
  Future<void> update({
    required Set<SupaValue<B, dynamic, dynamic>> values,
    required SupaFilter<B> filter,
  }) async {
    final json = values.fold<Map<String, dynamic>>(
      {},
      (prev, column) => prev..addAll(column.toJSON()),
    );

    await supabaseClient
        .schema(schema)
        .from(tableName)
        .update(json)
        .supaApplyFilter(filter);
  }

  /// Deletes records from the Supabase table.
  ///
  /// [filter] is the filter to apply to the query.
  Future<void> delete({required SupaFilter<B> filter}) => supabaseClient
      .schema(schema)
      .from(tableName)
      .delete()
      .supaApplyFilter(filter);
}
