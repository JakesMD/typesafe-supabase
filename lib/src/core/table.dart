import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/src/filter/filter.dart';
import 'package:typesafe_supabase/src/modifier/modifier.dart';
import 'package:typesafe_supabase/src/stream_filter/builder_extension.dart';
import 'package:typesafe_supabase/src/stream_modifier/modifier.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaTable}
///
/// Represents a table in the Supabase database.
///
/// {@endtemplate}
class SupaTable<B extends SupaCore, R extends SupaRecord<B>>
    with
        SupaFilterMixin<B>,
        SupaModifierMixin<B, R>,
        SupaStreamFilterMixin<B>,
        SupaStreamModifierMixin<B, R> {
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
  ///
  /// This can be a single column or a composite key.
  final List<String> primaryKey;

  /// The schema of the table. Defaults to `public`.
  final String schema;

  /// The client instance used to interact with supabase.
  final SupabaseClient supabaseClient;

  /// Converts a JSON map to a record.
  final R Function(Map<String, dynamic> json) recordFromJSON;

  /// Fetches records from the Supabase table.
  ///
  /// `columns`: The set of columns to fetch. If null, all columns are
  /// fetched.
  ///
  /// `filter`: The filter to apply to the query.
  ///
  /// `modifier`: The modifier to apply to the query.
  Future<T> fetch<T>({
    required SupaModifier<B, R, T, PostgrestBuilder<dynamic, dynamic, dynamic>,
            PostgrestBuilder<dynamic, dynamic, dynamic>>
        modifier,
    SupaFilter<B>? filter,
    Set<SupaColumnBase<B>>? columns,
  }) async {
    final request = supabaseClient
        .schema(schema)
        .from(tableName)
        .select(_generateColumnsPattern(columns));

    dynamic response;

    if (filter != null) {
      response =
          await request.supaApplyFilter(filter).supaApplyModifier(modifier);
    } else {
      response = await request.supaApplyModifier(modifier);
    }

    return _castResponse(modifier, response);
  }

  /// Inserts records into the Supabase table.
  ///
  /// `records`: The list of records to insert.
  ///
  /// `columns`: The set of columns to fetch. If null, all columns are
  /// fetched.
  ///
  /// `modifier`: The modifier to apply to the query.
  Future<T> insert<T>({
    required List<SupaInsert<B>> records,
    required SupaModifier<B, R, T, PostgrestBuilder<dynamic, dynamic, dynamic>,
            PostgrestBuilder<dynamic, dynamic, dynamic>>
        modifier,
    Set<SupaColumnBase<B>>? columns,
  }) async {
    final request = supabaseClient
        .schema(schema)
        .from(tableName)
        .insert(records.map((r) => r.toJSON()).toList());

    if (modifier is! SupaNoneModifier<B, R>) {
      final response = await request
          .select(_generateColumnsPattern(columns))
          .supaApplyModifier(modifier);
      return _castResponse(modifier, response);
    }

    return (await request) as T;
  }

  /// Updates records in the Supabase table.
  ///
  /// `values`: The set of values to update.
  ///
  /// `filter`: The filter to apply to the query. This targets the records to
  /// update.
  ///
  /// `columns`: The set of columns to fetch. If null, all columns are
  /// fetched.
  ///
  /// `modifier`: The modifier to apply to the query.
  Future<T> update<T>({
    required Set<SupaValue<B, dynamic, dynamic>> values,
    required SupaFilter<B> filter,
    required SupaModifier<B, R, T, PostgrestBuilder<dynamic, dynamic, dynamic>,
            PostgrestBuilder<dynamic, dynamic, dynamic>>
        modifier,
    Set<SupaColumnBase<B>>? columns,
  }) async {
    final json = values.fold<Map<String, dynamic>>(
      {},
      (prev, column) => prev..addAll(column.toJSON()),
    );

    final request = supabaseClient
        .schema(schema)
        .from(tableName)
        .update(json)
        .supaApplyFilter(filter);

    if (modifier is! SupaNoneModifier<B, R>) {
      final response = await request
          .select(_generateColumnsPattern(columns))
          .supaApplyModifier(modifier);
      return _castResponse(modifier, response);
    }

    return (await request) as T;
  }

  /// Updates or inserts records in the Supabase table.
  ///
  /// `records`: The list of records to update or insert.
  ///
  /// `filter`: The filter to apply to the query. This targets the records
  /// fetched after the upsert.
  ///
  /// `columns`: The set of columns to fetch. If null, all columns are
  /// fetched.
  ///
  /// `modifier`: The modifier to apply to the query.
  Future<T> upsert<T>({
    required List<SupaInsert<B>> records,
    required SupaModifier<B, R, T, PostgrestBuilder<dynamic, dynamic, dynamic>,
            PostgrestBuilder<dynamic, dynamic, dynamic>>
        modifier,
    SupaFilter<B>? filter,
    Set<SupaColumnBase<B>>? columns,
  }) async {
    var request = supabaseClient
        .schema(schema)
        .from(tableName)
        .upsert(records.map((r) => r.toJSON()).toList());

    if (filter != null) request = request.supaApplyFilter(filter);

    if (modifier is! SupaNoneModifier<B, R>) {
      final response = await request
          .select(_generateColumnsPattern(columns))
          .supaApplyModifier(modifier);
      return _castResponse(modifier, response);
    }

    return (await request) as T;
  }

  /// Deletes records from the Supabase table.
  ///
  /// `filter`: The filter to apply to the query. This targets the records to
  /// delete.
  ///
  /// `columns`: The set of columns to fetch. If null, all columns are
  /// fetched.
  ///
  /// `modifier`: The modifier to apply to the query.
  Future<T> delete<T>({
    required SupaFilter<B> filter,
    required SupaModifier<B, R, T, PostgrestBuilder<dynamic, dynamic, dynamic>,
            PostgrestBuilder<dynamic, dynamic, dynamic>>
        modifier,
    Set<SupaColumnBase<B>>? columns,
  }) async {
    final request = supabaseClient
        .schema(schema)
        .from(tableName)
        .delete()
        .supaApplyFilter(filter);

    if (modifier is! SupaNoneModifier<B, R>) {
      final response = await request
          .select(_generateColumnsPattern(columns))
          .supaApplyModifier(modifier);
      return _castResponse(modifier, response);
    }

    return (await request) as T;
  }

  /// Streams records from the Supabase table.
  ///
  /// `filter`: The filter to apply to the query.
  ///
  /// `modifier`: The modifier to apply to the query.
  Stream<List<R>> stream({
    SupaStreamFilter<B>? filter,
    SupaStreamModifier<B, R>? modifier,
  }) {
    final request = supabaseClient
        .schema(schema)
        .from(tableName)
        .stream(primaryKey: primaryKey);

    if (filter != null) {
      if (modifier != null) {
        return request
            .supaApplyFilter(filter)
            .supaApplyModifier(modifier)
            .map((list) => list.map(recordFromJSON).toList());
      } else {
        return request.supaApplyFilter(filter).map((list) {
          return list.map(recordFromJSON).toList();
        });
      }
    }

    if (modifier != null) {
      return request
          .supaApplyModifier(modifier)
          .map((list) => list.map(recordFromJSON).toList());
    }

    return request.map((list) => list.map(recordFromJSON).toList());
  }

  String _generateColumnsPattern(Set<SupaColumnBase<B>>? columns) =>
      columns?.map((c) => c.queryPattern).join(', ') ?? '*';

  T _castResponse<T>(
    SupaModifier<B, R, T, PostgrestBuilder<dynamic, dynamic, dynamic>,
            PostgrestBuilder<dynamic, dynamic, dynamic>>
        modifier,
    dynamic response,
  ) {
    if (modifier is SupaModifier<B, R, List<R>,
        PostgrestTransformBuilder<List<Map<String, dynamic>>>, dynamic>) {
      return (response as List<Map<String, dynamic>>)
          .map(recordFromJSON)
          .toList() as T;
    } else if (modifier is SupaModifier<B, R, R,
        PostgrestTransformBuilder<Map<String, dynamic>>, dynamic>) {
      return recordFromJSON(response as Map<String, dynamic>) as T;
    } else if (modifier is SupaCountModifier<B, R>) {
      return SupaCountResponse<B, R>(
        count: (response as PostgrestResponse).count,
        records: (response as PostgrestResponse<List<Map<String, dynamic>>>)
            .data
            .map(recordFromJSON)
            .toList(),
      ) as T;
    }
    return response as T;
  }
}
