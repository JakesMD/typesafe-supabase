part of '../filter.dart';

/// {@template SupaEqualsFilter}
///
/// A filter that checks if the value of the column is equal to [equalsValue].
///
/// {@endtemplate}
class SupaEqualsFilter<V extends SupaValue<dynamic>> extends SupaFilter<V> {
  SupaEqualsFilter._(this.equalsValue, super.previousFilter);

  /// The value to check the column is equal to.
  final V equalsValue;

  @override
  PostgrestFilterBuilder<T> build<T>(PostgrestFilterBuilder<T> builder) =>
      builder.eq(equalsValue.name, equalsValue.value as Object);
}
