import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';

export 'extensions/_extensions.dart';
export 'filters/_filters.dart';

/// {@template typesafe_supabase.SupaStreamFilter}
///
/// A filter that can be applied to a Supabase stream query.
///
/// {@macro typesafe_postgrest.PgFilter}
///
/// {@endtemplate}
class SupaStreamFilter<TableType> {
  /// {@macro typesafe_supabase.SupaStreamFilter}
  @internal
  const SupaStreamFilter(this.previousFilter);

  /// The filter that was applied before this one.
  final SupaStreamFilter<TableType>? previousFilter;

  /// Cascades the filter onto the provided [builder].
  @mustBeOverridden
  @internal
  SupabaseStreamBuilder build(SupabaseStreamFilterBuilder builder) => builder;
}
