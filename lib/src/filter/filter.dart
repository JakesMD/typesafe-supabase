import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

export 'builder_extension.dart';

part 'filters/equals.dart';
part 'filters/match.dart';
part 'filters/not_equals.dart';
part 'filters/text_search.dart';
part 'mixin.dart';

/// {@template SupaFilter}
///
/// Represents a filter that can be applied to a Supabase query.
///
/// {@endtemplate}
class SupaFilter<V extends SupaValue<dynamic>> implements SupaFilterMixin<V> {
  /// {@macro SupaFilter}
  const SupaFilter(this.previousFilter);

  /// The filter that was applied before this filter.
  final SupaFilter<V>? previousFilter;

  /// Cascades the Supabase filter onto the provided [builder].
  @mustBeOverridden
  @internal
  PostgrestFilterBuilder<T> build<T>(PostgrestFilterBuilder<T> builder) =>
      builder;

  @override
  SupaFilter<V> equals(V equalsValue) =>
      SupaEqualsFilter._(equalsValue, this) as SupaFilter<V>;

  @override
  SupaFilter<V> notEquals(V notEqualsValue) =>
      SupaNotEqualsFilter._(notEqualsValue, this) as SupaFilter<V>;

  @override
  SupaFilter<V> match(Set<V> matchValues) =>
      SupaMatchFilter._(matchValues, this) as SupaFilter<V>;

  @override
  SupaFilter<V> textSearch(V searchText) =>
      SupaTextSearchFilter._(searchText, this) as SupaFilter<V>;
}
