import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaOverlapsArrayFilter}
///
/// ### Array with a common element
///
/// Only relevant for array columns. A filter that only
/// matches rows where the [column] and [values] have an element in common.
///
/// `column`: The array column to filter on.
///
/// `values`: The array of values to filter with.
///
/// {@endtemplate}
class SupaOverlapsArrayFilter<B extends SupaCore, J> extends SupaFilter<B> {
  /// {@macro SupaOverlapsArrayFilter}
  @internal
  const SupaOverlapsArrayFilter(this.column, this.values, super.previousFilter);

  /// The array column to filter on.
  final SupaColumn<B, dynamic, List<J>?> column;

  /// The array of values to filter with.
  final List<J> values;

  @override
  PostgrestFilterBuilder<P> build<P>(PostgrestFilterBuilder<P> builder) =>
      builder.overlaps(column.name, values);
}
