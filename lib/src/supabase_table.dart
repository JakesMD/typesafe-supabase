// Needs access to $tableName.
// ignore_for_file: invalid_use_of_internal_member

import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/src/stream_filter/stream_filter.dart';
import 'package:typesafe_supabase/src/stream_modifier/stream_modifier.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupabaseTable}
///
/// A [PgTable] configured to use a [SupabaseClient] with added support for
/// Supabase's Realtime API.
///
/// `client`: The [SupabaseClient] to use.
///
/// `tableName`: The name of the table in the Supabase database.
///
/// `primaryKey`: The list of columns that combined act as the primary key for
///               the table. This is required Supabase's Realtime API.
///
/// `schema`: The schema in which the table is located in the Supabase database.
///
/// {@endtemplate}
class SupabaseTable<TableType> extends PgTable<TableType> {
  /// {@macro SupabaseTable}
  SupabaseTable(
    SupabaseClient client, {
    required super.tableName,
    required this.primaryKey,
    String schema = 'public',
  }) : super(
            initialQuery: (tableName) => client.schema(schema).from(tableName));

  /// The list of columns that combined act as the primary key for the table.
  /// This is required Supabase's Realtime API.
  final PgColumnList<TableType> primaryKey;

  /// Stream data from the database. The result type is determined by the
  /// modifier.
  ///
  /// [filter] The filter to apply to the query.
  ///
  /// [modifier] The modifier to apply to the query.
  Stream<PgJsonList> stream({
    SupaStreamModifier<TableType, PgJsonList, dynamic>? modifier,
    SupaStreamFilter<TableType>? filter,
  }) =>
      (initialQuery($tableName) as SupabaseQueryBuilder)
          .stream(primaryKey: primaryKey.map((e) => e.name).toList())
          .applySupaStreamFilter(filter)
          .applySupaStreamModifier(modifier);

  /// Streams a list of models from the database.
  ///
  /// [modelBuilder] The builder of the model to return.
  ///
  /// [filter] The filter to apply to the query.
  ///
  /// [modifier] The modifier to apply to the query.
  Stream<List<ModelType>> streamModels<ModelType extends PgModel<TableType>>({
    required PgModelBuilder<TableType, ModelType> modelBuilder,
    SupaStreamModifier<TableType, PgJsonList, dynamic>? modifier,
    SupaStreamFilter<TableType>? filter,
  }) {
    final modelModifier =
        SupaAsModelsStreamModifier(modifier, modelBuilder.constructor);

    return (initialQuery($tableName) as SupabaseQueryBuilder)
        .stream(primaryKey: primaryKey.map((e) => e.name).toList())
        .applySupaStreamFilter(filter)
        .applySupaStreamModifier(modelModifier)
        .map((data) => data.map(modelModifier.fromJson).toList());
  }

  /// Streams a single model from the database.
  ///
  /// [modelBuilder] The builder of the model to return.
  ///
  /// [filter] The filter to apply to the query.
  ///
  /// [modifier] The modifier to apply to the query.
  Stream<ModelType> streamModel<ModelType extends PgModel<TableType>>({
    required PgModelBuilder<TableType, ModelType> modelBuilder,
    SupaStreamModifier<TableType, PgJsonList, dynamic>? modifier,
    SupaStreamFilter<TableType>? filter,
  }) {
    final modelModifier =
        SupaAsModelStreamModifier(modifier, modelBuilder.constructor);

    return (initialQuery($tableName) as SupabaseQueryBuilder)
        .stream(primaryKey: primaryKey.map((e) => e.name).toList())
        .applySupaStreamFilter(filter)
        .applySupaStreamModifier(modelModifier)
        .map((data) => modelModifier.fromJson(data.first));
  }

  /// Streams a nullable model from the database.
  ///
  /// [modelBuilder] The builder of the model to return.
  ///
  /// [filter] The filter to apply to the query.
  ///
  /// [modifier] The modifier to apply to the query.
  Stream<ModelType?> maybeStreamModel<ModelType extends PgModel<TableType>>({
    required PgModelBuilder<TableType, ModelType> modelBuilder,
    SupaStreamModifier<TableType, PgJsonList, dynamic>? modifier,
    SupaStreamFilter<TableType>? filter,
  }) {
    final modelModifier =
        SupaMaybeAsModelStreamModifier(modifier, modelBuilder.constructor);

    return (initialQuery($tableName) as SupabaseQueryBuilder)
        .stream(primaryKey: primaryKey.map((e) => e.name).toList())
        .applySupaStreamFilter(filter)
        .applySupaStreamModifier(modelModifier)
        .map((data) =>
            data.isNotEmpty ? modelModifier.fromJson(data.first) : null);
  }
}
