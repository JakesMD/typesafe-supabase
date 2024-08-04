import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@macro SupaIncludedInFilter}
class SupaIncludedInStreamFilter<B extends SupaCore, J>
    extends SupaStreamFilter<B> {
  /// {@macro SupaIncludedInFilter}
  @internal
  const SupaIncludedInStreamFilter(this.column, this.values);

  /// The column to filter on.
  final SupaColumn<B, dynamic, J> column;

  /// The list to filter with.
  final List<J> values;

  @override
  SupabaseStreamBuilder build(SupabaseStreamFilterBuilder builder) =>
      builder.inFilter(column.name, values as List<Object>);
}
