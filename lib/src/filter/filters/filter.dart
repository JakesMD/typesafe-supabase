import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaFilterFilter}
///
/// ### Match the filter
///
/// Match only rows which satisfy the filter. This is an escape hatch - you
/// should use the specific filter methods wherever possible.
///
/// `column`: The column to filter on.
///
/// `operator`: The operator to filter with, following PostgREST syntax.
///
/// `value`: The value to filter with, following PostgREST syntax.
///
/// {@endtemplate}
class SupaFilterFilter<B extends SupaCore> extends SupaFilter<B> {
  /// {@macro SupaFilterFilter}
  @internal
  const SupaFilterFilter(
    this.column,
    this.operator,
    this.value,
    super.previousFilter,
  );

  /// The column to filter on.
  final String column;

  /// The operator to filter with, following PostgREST syntax.
  final String operator;

  /// The value to filter with, following PostgREST syntax.
  final Object? value;

  @override
  PostgrestFilterBuilder<P> build<P>(PostgrestFilterBuilder<P> builder) =>
      builder.filter(column, operator, value);
}
