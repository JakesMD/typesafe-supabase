import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template typesafe_supabase.SupaEqualStreamFilter}
///
/// Column is equal to a value.
///
/// A filter that only matches rows where the column is equal to [value].
///
/// The value must not be null.
///
/// `value`: The value to filter with.
///
/// {@endtemplate}
class SupaEqualStreamFilter<TableType, T> extends SupaStreamFilter<TableType> {
  /// {@macro typesafe_supabase.SupaEqualStreamFilter}
  @internal
  const SupaEqualStreamFilter(this.column, this.value, super.previousFilter);

  /// The column to filter by.
  final PgFilterColumn<TableType, T, dynamic> column;

  /// The value to filter with.
  final T value;

  @override
  @internal
  SupabaseStreamBuilder build(SupabaseStreamFilterBuilder builder) =>
      builder.eq(column.filterPattern, column.toJson(value) as Object);
}
