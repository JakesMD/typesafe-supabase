import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/src/filter/filter.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaTable}
///
/// Represents a table in the Supabase database.
///
/// {@endtemplate}
class SupaTable<B extends SupaCore, R extends SupaRecord<B>>
    with SupaFilterMixin<B> {
  /// {@macro SupaTable}
  const SupaTable(
    this.recordFromJSON, {
    required this.tableName,
    required this.primaryKey,
    required this.supabaseClient,
  });

  /// The name of the table.
  final String tableName;

  /// The primary key of the table.
  final String primaryKey;

  /// The client instance used to interact with supabase.
  final SupabaseClient supabaseClient;

  /// Converts a JSON map to a record.
  final R Function(Map<String, dynamic> json) recordFromJSON;

  /// Fetches records from the Supabase table.
  ///
  /// [columns] is the set of columns to fetch. If null, all columns are
  /// fetched.
  /// [filter] is the filter to apply to the query.
  Future<List<R>> fetch({
    required SupaFilter<B> filter,
    Set<SupaColumn<B, dynamic, dynamic>>? columns,
  }) async {
    final response = await supabaseClient
        .from(tableName)
        .select(columns?.map((c) => c.name).join(', ') ?? '*')
        .supaApply(filter);

    return response.map(recordFromJSON).toList();
  }

  /// Inserts records into the Supabase table.
  ///
  /// [records] is the list of records to insert.
  Future<void> insert({
    required List<SupaInsert<B>> records,
  }) =>
      supabaseClient
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

    await supabaseClient.from(tableName).update(json).supaApply(filter);
  }

  /// Deletes records from the Supabase table.
  ///
  /// [filter] is the filter to apply to the query.
  Future<void> delete({required SupaFilter<B> filter}) =>
      supabaseClient.from(tableName).delete().supaApply(filter);
}