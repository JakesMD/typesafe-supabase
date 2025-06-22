import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@macro typesafe_postgrest.PgLessFilter}
class SupaLessStreamFilter<TableType, T> extends SupaStreamFilter<TableType> {
  /// {@macro typesafe_postgrest.PgLessFilter}
  @internal
  const SupaLessStreamFilter(this.column, this.value, super.previousFilter);

  /// The column to filter by.
  final PgFilterColumn<TableType, T, dynamic> column;

  /// The value to filter with.
  final T value;

  @override
  SupabaseStreamBuilder build(SupabaseStreamFilterBuilder builder) =>
      builder.lt(column.filterPattern, column.toJson(value) as Object);
}
