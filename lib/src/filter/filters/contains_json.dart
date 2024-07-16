import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaContainsJSONFilter}
///
/// ### Jsonb column contains every element in a value
///
/// Only relevant for jsonb columns. A filter that only
/// matches rows where the [column] contains every element appearing in
/// [json].
///
/// `column`: The json column to filter on.
///
/// `json`: The json value to filter with.
///
/// {@endtemplate}
class SupaContainsJSONFilter<B extends SupaCore> extends SupaFilter<B> {
  /// {@macro SupaContainsJSONFilter}
  @internal
  const SupaContainsJSONFilter(this.column, this.json, super.previousFilter);

  /// The array column to filter on.
  final SupaColumn<B, dynamic, Map<String, dynamic>?> column;

  /// The json value filter with.
  final Map<String, dynamic> json;

  @override
  PostgrestFilterBuilder<P> build<P>(PostgrestFilterBuilder<P> builder) =>
      builder.contains(column.name, json);
}
