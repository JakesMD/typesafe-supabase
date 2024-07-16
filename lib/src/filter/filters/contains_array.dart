import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaContainsArrayFilter}
///
/// ### Array column contains every element in a value
///
/// Only relevant for array columns. A filter that only
/// matches rows where the [column] contains every element appearing in
/// [values].
///
/// `column`: The array column to filter on.
///
/// `values`: The array of values to filter with.
///
/// {@endtemplate}
class SupaContainsArrayFilter<B extends SupaCore, J> extends SupaFilter<B> {
  /// {@macro SupaContainsArrayFilter}
  @internal
  const SupaContainsArrayFilter(this.column, this.values, super.previousFilter);

  /// The array column to filter on.
  final SupaColumn<B, dynamic, List<J>?> column;

  /// The array of values to filter with.
  final List<J> values;

  @override
  PostgrestFilterBuilder<P> build<P>(PostgrestFilterBuilder<P> builder) =>
      builder.contains(column.name, values);
}
