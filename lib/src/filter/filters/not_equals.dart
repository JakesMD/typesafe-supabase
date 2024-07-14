part of '../filter.dart';

/// {@template SupaNotEqualsFilter}
///
/// A filter that checks if the value of the column is not equal to
/// [notEqualsValue].
///
/// {@endtemplate}
class SupaNotEqualsFilter<V extends SupaValue<dynamic>> extends SupaFilter<V> {
  SupaNotEqualsFilter._(this.notEqualsValue, super.previousFilter);

  /// The value to check the column is not equal to.
  final V notEqualsValue;

  @override
  PostgrestFilterBuilder<T> build<T>(PostgrestFilterBuilder<T> builder) =>
      builder.neq(notEqualsValue.name, notEqualsValue.value as Object);
}
