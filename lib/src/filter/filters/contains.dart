part of '../filter.dart';

/// {@template SupaContainsFilter}
///
/// A filter that checks if the value of the column contains [containsValue].
///
/// {@endtemplate}
class SupaContainsFilter<V extends SupaValue<dynamic>> extends SupaFilter<V> {
  SupaContainsFilter._(this.containsValue, super.previousFilter);

  /// The value to check the column contains.
  final V containsValue;

  @override
  PostgrestFilterBuilder<T> build<T>(PostgrestFilterBuilder<T> builder) =>
      builder.contains(containsValue.name, containsValue.value as Object);
}
