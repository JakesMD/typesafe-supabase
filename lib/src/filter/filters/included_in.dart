import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaIncludedInFilter}
///
/// ### Column is in an array
///
/// A filter that only matches rows where the column is found in the specified
/// [values].
///
/// `column`: The column to filter on.
///
/// `values`: The list to filter with.
///
/// {@endtemplate}
class SupaIncludedInFilter<B extends SupaCore, J> extends SupaFilter<B> {
  /// {@macro SupaIncludedInFilter}
  @internal
  const SupaIncludedInFilter(this.column, this.values, super.previousFilter);

  /// The column to filter on.
  final SupaColumn<B, dynamic, J> column;

  /// The list to filter with.
  final List<J> values;

  @override
  PostgrestFilterBuilder<P> build<P>(PostgrestFilterBuilder<P> builder) =>
      builder.inFilter(column.name, values);
}
