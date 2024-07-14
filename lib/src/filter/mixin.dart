part of 'filter.dart';

/// A mixin that provides filters.
mixin SupaFilterMixin<V extends SupaValue<dynamic>> {
  /// The filter that was applied before this one.
  SupaFilter<V>? get previousFilter => null;

  /// Cascades a filter that checks if the value of the column is equal to
  /// [equalsValue].
  SupaFilter<V> equals(V equalsValue) =>
      SupaEqualsFilter._(equalsValue, previousFilter) as SupaFilter<V>;

  /// Cascades a filter that checks if the value of the column is not equal to
  /// [notEqualsValue].
  SupaFilter<V> notEquals(V notEqualsValue) =>
      SupaNotEqualsFilter._(notEqualsValue, previousFilter) as SupaFilter<V>;

  /// Cascades a filter that checks if the columns and values match
  /// [matchValues].
  SupaFilter<V> match(Set<V> matchValues) =>
      SupaMatchFilter._(matchValues, previousFilter) as SupaFilter<V>;

  /// Cascades a filter that checks if the value of the column contains
  /// [containsValue].
  SupaFilter<V> contains(V containsValue) =>
      SupaContainsFilter._(containsValue, previousFilter) as SupaFilter<V>;
}
