import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaNotFilter}
///
/// ### Don't match the filter
///
/// A filter that only matches rows that don't satisfy the filter.
///
/// `column`: The column to filter on.
///
/// `operator`: The operator to be negated to filter with, following PostgREST
/// syntax.
///
/// `value`: The value to filter with, following PostgREST syntax.
///
/// {@endtemplate}
class SupaNotFilter<B extends SupaCore> extends SupaFilter<B> {
  /// {@macro SupaNotFilter}
  @internal
  const SupaNotFilter(
    this.column,
    this.operator,
    this.value,
    super.previousFilter,
  );

  /// The column to filter on.
  final String column;

  /// The operator to be negated to filter with, following PostgREST syntax.
  final String operator;

  /// The value to filter with, following PostgREST syntax.
  final Object? value;

  @override
  PostgrestFilterBuilder<P> build<P>(PostgrestFilterBuilder<P> builder) =>
      builder.not(column, operator, value);
}
