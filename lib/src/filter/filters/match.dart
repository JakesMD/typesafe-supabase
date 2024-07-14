part of '../filter.dart';

/// {@template SupaMatchFilter}
///
/// A filter that checks if the value of the column matches any of the values in
/// [matchValues].
///
/// {@endtemplate}
class SupaMatchFilter<V extends SupaValue<dynamic>> extends SupaFilter<V> {
  SupaMatchFilter._(this.matchValues, super.previousFilter);

  /// The values to check matches for.
  final Set<V> matchValues;

  @override
  PostgrestFilterBuilder<T> build<T>(PostgrestFilterBuilder<T> builder) {
    final matcher = matchValues.fold<Map<String, dynamic>>(
      {},
      (prev, column) => {...prev, column.name: column.value},
    );

    return builder.match(matcher.cast());
  }
}
