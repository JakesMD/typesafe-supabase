part of 'filter.dart';

/// A mixin that provides filters.
mixin SupaFilterMixin<V extends SupaValue<dynamic>> {
  /// Cascades a filter that checks if the value of the column is equal to
  /// [equalsValue].
  SupaFilter<V> equals(V equalsValue) =>
      SupaEqualsFilter._(equalsValue, null) as SupaFilter<V>;

  /// Cascades a filter that checks if the value of the column is not equal to
  /// [notEqualsValue].
  SupaFilter<V> notEquals(V notEqualsValue) =>
      SupaNotEqualsFilter._(notEqualsValue, null) as SupaFilter<V>;

  /// Cascades a filter that checks if the columns and values match
  /// [matchValues].
  SupaFilter<V> match(Set<V> matchValues) =>
      SupaMatchFilter._(matchValues, null) as SupaFilter<V>;

  /// Cascades a filter that checks if the value of the column contains
  /// [searchText].
  SupaFilter<V> textSearch(V searchText) =>
      SupaTextSearchFilter._(searchText, null) as SupaFilter<V>;
}
