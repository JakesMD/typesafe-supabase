part of '../filter.dart';

/// {@template SupaTextSearchFilter}
///
/// A filter that checks if the value of the column contains [searchText].
///
/// {@endtemplate}
class SupaTextSearchFilter<V extends SupaValue<dynamic>> extends SupaFilter<V> {
  SupaTextSearchFilter._(this.searchText, super.previousFilter);

  /// The text to search the column for.
  final V searchText;

  @override
  PostgrestFilterBuilder<T> build<T>(PostgrestFilterBuilder<T> builder) =>
      builder.textSearch(searchText.name, searchText.value as String);
}
