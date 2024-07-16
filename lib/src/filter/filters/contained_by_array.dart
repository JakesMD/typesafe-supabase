import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaContainedByArrayFilter}
///
/// ### Array column contained by array value
///
/// Only relevant for array columns. A filter that only
/// matches rows where the every element appearing in [column] is contained by
/// [value].
///
/// `column`: The array column to filter on.
///
/// `value`: The array value to filter with.
///
/// {@endtemplate}
class SupaContainedByArrayFilter<B extends SupaCore, T, J>
    extends SupaFilter<B> {
  /// {@macro SupaContainedByArrayFilter}
  @internal
  const SupaContainedByArrayFilter(
    this.column,
    this.value,
    super.previousFilter,
  );

  /// The array column to filter on.
  final SupaColumn<B, dynamic, List<J>?> column;

  /// The array value to filter with.
  final List<J> value;

  @override
  PostgrestFilterBuilder<P> build<P>(PostgrestFilterBuilder<P> builder) =>
      builder.containedBy(column.name, value);
}
