import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaContainedByJSONFilter}
///
/// ### Jsonb column contained by json value
///
/// Only relevant for jsonb columns. A filter that only
/// matches rows where the every element appearing in [column] is contained by
/// [value].
///
/// `column`: The json column to filter on.
///
/// `value`: The json value to filter with.
///
/// {@endtemplate}
class SupaContainedByJSONFilter<B extends SupaCore> extends SupaFilter<B> {
  /// {@macro SupaContainedByJSONFilter}
  @internal
  const SupaContainedByJSONFilter(
    this.column,
    this.value,
    super.previousFilter,
  );

  /// The json column to filter on.
  final SupaColumn<B, dynamic, Map<String, dynamic>?> column;

  /// The json value filter with.
  final Map<String, dynamic> value;

  @override
  PostgrestFilterBuilder<P> build<P>(PostgrestFilterBuilder<P> builder) =>
      builder.containedBy(column.name, value);
}
