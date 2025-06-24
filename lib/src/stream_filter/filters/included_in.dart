import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@macro typesafe_postgrest.PgIncludedInFilter}
class SupaIncludedInStreamFilter<TableType, T>
    extends SupaStreamFilter<TableType> {
  /// {@macro typesafe_postgrest.PgIncludedInFilter}
  @internal
  const SupaIncludedInStreamFilter(
      this.column, this.values, super.previousFilter);

  /// The column to filter by.
  final PgFilterColumn<TableType, dynamic, T> column;

  /// The list to filter with.
  final List<T> values;

  @override
  SupabaseStreamBuilder build(SupabaseStreamFilterBuilder builder) =>
      builder.inFilter(column.filterPattern, values as List<Object>);
}
