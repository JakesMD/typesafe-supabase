import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// A mixin that provides filters.
mixin SupaFilterMixin<B extends SupaCore> {
  /// {@macro SupaContainedByArrayFilter}
  SupaFilter<B> containedByArray<J>(
    SupaColumn<B, dynamic, List<J>?> column,
    List<J> value,
  ) =>
      SupaContainedByArrayFilter(column, value, null);

  /// {@macro SupaContainedByJSONFilter}
  SupaFilter<B> containedByJSON(
    SupaColumn<B, dynamic, Map<String, dynamic>?> column,
    Map<String, dynamic> value,
  ) =>
      SupaContainedByJSONFilter(column, value, null);

  /// {@macro SupaContainedByRangeFilter}
  SupaFilter<B> containedByRange<J extends Object>(
    SupaColumn<B, dynamic, dynamic> column,
    J lowerBound,
    J upperBound, {
    SupaRangeType rangeType = SupaRangeType.inclusiveInclusive,
  }) =>
      SupaContainedByRangeFilter(
        column,
        lowerBound,
        upperBound,
        rangeType,
        null,
      );

  /// {@macro SupaContainsArrayFilter}
  SupaFilter<B> containsArray<J>(
    SupaColumn<B, dynamic, List<J>?> column,
    List<J> values,
  ) =>
      SupaContainsArrayFilter(column, values, null);

  /// {@macro SupaContainsJSONFilter}
  SupaFilter<B> containsJSON(
    SupaColumn<B, dynamic, Map<String, dynamic>?> column,
    Map<String, dynamic> json,
  ) =>
      SupaContainsJSONFilter(column, json, null);

  /// {@macro SupaContainsRangeFilter}
  SupaFilter<B> containsRange<J extends Object>(
    SupaColumn<B, dynamic, dynamic> column,
    J lowerBound,
    J upperBound, {
    SupaRangeType rangeType = SupaRangeType.inclusiveInclusive,
  }) =>
      SupaContainsRangeFilter(column, lowerBound, upperBound, rangeType, null);

  /// {@macro SupaEqualFilter}
  SupaFilter<B> equal(SupaValue<B, dynamic, dynamic> value) =>
      SupaEqualFilter(value, null);

  /// {@macro SupaFilterFilter}
  SupaFilter<B> filter(String column, String operator, Object? value) =>
      SupaFilterFilter(column, operator, value, null);

  /// {@macro SupaGreaterFilter}
  SupaFilter<B> greater(SupaValue<B, dynamic, Object?> value) =>
      SupaGreaterFilter(value, null);

  /// {@macro SupaGreaterOrEqualFilter}
  SupaFilter<B> greaterOrEqual(SupaValue<B, dynamic, Object?> value) =>
      SupaGreaterOrEqualFilter(value, null);

  /// {@macro SupaIncludedInFilter}
  SupaFilter<B> includedIn<J>(
    SupaColumn<B, dynamic, J?> column,
    List<J> values,
  ) =>
      SupaIncludedInFilter(column, values, null);

  /// {@macro SupaIsNullFilter}
  SupaFilter<B> isNull(SupaColumn<B, dynamic, Object?> column) =>
      SupaIsNullFilter(column, null);

  /// {@macro SupaLessFilter}
  SupaFilter<B> less(SupaValue<B, dynamic, Object?> value) =>
      SupaLessFilter(value, null);

  /// {@macro SupaLessOrEqualFilter}
  SupaFilter<B> lessOrEqual(SupaValue<B, dynamic, Object?> value) =>
      SupaLessOrEqualFilter(value, null);

  /// {@macro SupaLikeFilter}
  SupaFilter<B> like(
    SupaColumn<B, dynamic, String?> column,
    String pattern, {
    bool isCaseSensitive = true,
  }) =>
      SupaLikeFilter(column, pattern, isCaseSensitive, null);

  /// {@macro SupaMatchFilter}
  SupaFilter<B> match(Set<SupaValue<B, dynamic, dynamic>> values) =>
      SupaMatchFilter(values, null);

  /// {@macro SupaNotFilter}
  SupaFilter<B> not(String column, String operator, Object? value) =>
      SupaNotFilter(column, operator, value, null);

  /// {@macro SupaOrFilter}
  SupaFilter<B> or(String filter, {String? referencedTable}) =>
      SupaOrFilter(filter, referencedTable, null);

  /// {@macro SupaNotEqualFilter}
  SupaFilter<B> notEqual(SupaValue<B, dynamic, dynamic> value) =>
      SupaNotEqualFilter(value, null);

  /// {@macro SupaOverlapsArrayFilter}
  SupaFilter<B> overlapsArray<J>(
    SupaColumn<B, dynamic, List<J>?> column,
    List<J> values,
  ) =>
      SupaOverlapsArrayFilter(column, values, null);

  /// {@macro SupaOverlapsRangeFilter}
  SupaFilter<B> overlapsRange<J extends Object>(
    SupaColumn<B, dynamic, dynamic> column,
    J lowerBound,
    J upperBound, {
    SupaRangeType rangeType = SupaRangeType.inclusiveInclusive,
  }) =>
      SupaContainsRangeFilter(column, lowerBound, upperBound, rangeType, null);

  /// {@macro SupaRangeAdjacentFilter}
  SupaFilter<B> rangeAdjacent<J extends Object>(
    SupaColumn<B, dynamic, dynamic> column,
    J lowerBound,
    J upperBound, {
    SupaRangeType rangeType = SupaRangeType.inclusiveInclusive,
  }) =>
      SupaRangeAdjacentFilter(column, lowerBound, upperBound, rangeType, null);

  /// {@macro SupaRangeGreaterFilter}
  SupaFilter<B> rangeGreater<J extends Object>(
    SupaColumn<B, dynamic, dynamic> column,
    J lowerBound,
    J upperBound, {
    SupaRangeType rangeType = SupaRangeType.inclusiveInclusive,
  }) =>
      SupaRangeGreaterFilter(column, lowerBound, upperBound, rangeType, null);

  /// {@macro SupaRangeGreaterOrEqualFilter}
  SupaFilter<B> rangeGreaterOrEqual<J extends Object>(
    SupaColumn<B, dynamic, dynamic> column,
    J lowerBound,
    J upperBound, {
    SupaRangeType rangeType = SupaRangeType.inclusiveInclusive,
  }) =>
      SupaRangeGreaterOrEqualFilter(
        column,
        lowerBound,
        upperBound,
        rangeType,
        null,
      );

  /// {@macro SupaRangeLessFilter}
  SupaFilter<B> rangeLess<J extends Object>(
    SupaColumn<B, dynamic, dynamic> column,
    J lowerBound,
    J upperBound, {
    SupaRangeType rangeType = SupaRangeType.inclusiveInclusive,
  }) =>
      SupaRangeLessFilter(column, lowerBound, upperBound, rangeType, null);

  /// {@macro SupaRangeLessOrEqualFilter}
  SupaFilter<B> rangeLessOrEqual<J extends Object>(
    SupaColumn<B, dynamic, dynamic> column,
    J lowerBound,
    J upperBound, {
    SupaRangeType rangeType = SupaRangeType.inclusiveInclusive,
  }) =>
      SupaRangeLessOrEqualFilter(
        column,
        lowerBound,
        upperBound,
        rangeType,
        null,
      );

  /// {@macro SupaTextSearchFilter}
  SupaFilter<B> textSearch(
    SupaValue<B, dynamic, String?> searchText, {
    String? config,
    TextSearchType? type,
  }) =>
      SupaTextSearchFilter(searchText, config, type, null);
}
