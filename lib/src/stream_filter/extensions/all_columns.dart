import 'package:typesafe_supabase/typesafe_supabase.dart';

/// Provides stream filters to all column types.
extension SupaAllFilterColumnsX<TableType, ValueType, JsonValueType>
    on PgColumn<TableType, ValueType, JsonValueType> {
  /// {@macro typesafe_supabase.SupaEqualStreamFilter}
  SupaStreamFilter<TableType> streamEquals(ValueType value) =>
      SupaEqualStreamFilter(this, value, null);

  /// {@macro typesafe_postgrest.PgGreaterOrEqualFilter}
  SupaStreamFilter<TableType> streamGreaterOrEqual(ValueType value) =>
      SupaGreaterOrEqualStreamFilter(this, value, null);

  /// {@macro typesafe_postgrest.PgGreaterFilter}
  SupaStreamFilter<TableType> streamGreater(ValueType value) =>
      SupaGreaterStreamFilter(this, value, null);

  /// {@macro typesafe_postgrest.PgIncludedInFilter}
  SupaStreamFilter<TableType> streamIncludedIn(List<ValueType> values) =>
      SupaIncludedInStreamFilter(this, values, null);

  /// {@macro typesafe_postgrest.PgLessOrEqualFilter}
  SupaStreamFilter<TableType> streamLessOrEqual(ValueType value) =>
      SupaLessOrEqualStreamFilter(this, value, null);

  /// {@macro typesafe_postgrest.PgLessFilter}
  SupaStreamFilter<TableType> streamLess(ValueType value) =>
      SupaLessStreamFilter(this, value, null);

  /// {@macro typesafe_postgrest.PgNotEqualFilter}
  SupaStreamFilter<TableType> streamNotEqual(ValueType value) =>
      SupaNotEqualStreamFilter(this, value, null);
}
