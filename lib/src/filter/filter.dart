import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

export 'builder_extension.dart';
export 'filters/_filters.dart';
export 'mixin.dart';
export 'range_type.dart';

/// {@template SupaFilter}
///
/// Represents a filter that can be applied to a Supabase query.
///
/// {@endtemplate}
class SupaFilter<B extends SupaCore> implements SupaFilterMixin<B> {
  /// {@macro SupaFilter}
  @internal
  const SupaFilter(this.previousFilter);

  /// The filter that was applied before this filter.
  final SupaFilter<B>? previousFilter;

  /// Cascades the Supabase filter onto the provided [builder].
  @mustBeOverridden
  @internal
  PostgrestFilterBuilder<P> build<P>(PostgrestFilterBuilder<P> builder) =>
      builder;

  @override
  SupaFilter<B> containedByArray<T>(
    SupaColumn<B, dynamic, List<dynamic>?> column,
    List<T> value,
  ) =>
      SupaContainedByArrayFilter(column, value, this);

  @override
  SupaFilter<B> containedByJSON(
    SupaColumn<B, dynamic, Map<String, dynamic>?> column,
    Map<String, dynamic> value,
  ) =>
      SupaContainedByJSONFilter(column, value, this);

  @override
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
        this,
      );

  @override
  SupaFilter<B> containsArray<J>(
    SupaColumn<B, dynamic, List<J>?> column,
    List<J> values,
  ) =>
      SupaContainsArrayFilter(column, values, this);

  @override
  SupaFilter<B> containsJSON(
    SupaColumn<B, dynamic, Map<String, dynamic>?> column,
    Map<String, dynamic> json,
  ) =>
      SupaContainsJSONFilter(column, json, this);

  @override
  SupaFilter<B> containsRange<J extends Object>(
    SupaColumn<B, dynamic, dynamic> column,
    J lowerBound,
    J upperBound, {
    SupaRangeType rangeType = SupaRangeType.inclusiveInclusive,
  }) =>
      SupaContainsRangeFilter(column, lowerBound, upperBound, rangeType, this);

  @override
  SupaFilter<B> equal(SupaValue<B, dynamic, dynamic> value) =>
      SupaEqualFilter(value, this);

  @override
  SupaFilter<B> filter(String column, String operator, Object? value) =>
      SupaFilterFilter(column, operator, value, this);

  @override
  SupaFilter<B> greater(SupaValue<B, dynamic, num?> value) =>
      SupaGreaterFilter(value, this);

  @override
  SupaFilter<B> greaterOrEqual(SupaValue<B, dynamic, num?> value) =>
      SupaGreaterOrEqualFilter(value, this);

  @override
  SupaFilter<B> includedIn<J>(
    SupaColumn<B, dynamic, List<J>?> column,
    List<J> values,
  ) =>
      SupaIncludedInFilter(column, values, this);

  @override
  SupaFilter<B> isNull(SupaColumn<B, dynamic, Object?> column) =>
      SupaIsNullFilter(column, this);

  @override
  SupaFilter<B> less(SupaValue<B, dynamic, num?> value) =>
      SupaLessFilter(value, this);

  @override
  SupaFilter<B> lessOrEqual(SupaValue<B, dynamic, num?> value) =>
      SupaLessOrEqualFilter(value, this);

  @override
  SupaFilter<B> like(
    SupaColumn<B, dynamic, String?> column,
    String pattern, {
    bool isCaseSensitive = true,
  }) =>
      SupaLikeFilter(column, pattern, isCaseSensitive, this);

  @override
  SupaFilter<B> match(Set<SupaValue<B, dynamic, dynamic>> values) =>
      SupaMatchFilter(values, this);

  @override
  SupaFilter<B> notEqual(SupaValue<B, dynamic, dynamic> value) =>
      SupaNotEqualFilter(value, this);

  @override
  SupaFilter<B> not(String column, String operator, Object? value) =>
      SupaNotFilter(column, operator, value, this);

  @override
  SupaFilter<B> or(String filter, {String? referencedTable}) =>
      SupaOrFilter(filter, referencedTable, this);

  @override
  SupaFilter<B> overlapsArray<J>(
    SupaColumn<B, dynamic, List<J>?> column,
    List<J> values,
  ) =>
      SupaOverlapsArrayFilter(column, values, this);

  @override
  SupaFilter<B> overlapsRange<J extends Object>(
    SupaColumn<B, dynamic, dynamic> column,
    J lowerBound,
    J upperBound, {
    SupaRangeType rangeType = SupaRangeType.inclusiveInclusive,
  }) =>
      SupaOverlapsRangeFilter(column, lowerBound, upperBound, rangeType, this);

  @override
  SupaFilter<B> rangeAdjacent<J extends Object>(
    SupaColumn<B, dynamic, dynamic> column,
    J lowerBound,
    J upperBound, {
    SupaRangeType rangeType = SupaRangeType.inclusiveInclusive,
  }) =>
      SupaRangeAdjacentFilter(column, lowerBound, upperBound, rangeType, this);

  @override
  SupaFilter<B> rangeGreater<J extends Object>(
    SupaColumn<B, dynamic, dynamic> column,
    J lowerBound,
    J upperBound, {
    SupaRangeType rangeType = SupaRangeType.inclusiveInclusive,
  }) =>
      SupaRangeGreaterFilter(column, lowerBound, upperBound, rangeType, this);

  @override
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
        this,
      );

  @override
  SupaFilter<B> rangeLess<J extends Object>(
    SupaColumn<B, dynamic, dynamic> column,
    J lowerBound,
    J upperBound, {
    SupaRangeType rangeType = SupaRangeType.inclusiveInclusive,
  }) =>
      SupaRangeLessFilter(column, lowerBound, upperBound, rangeType, this);

  @override
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
        this,
      );

  @override
  SupaFilter<B> textSearch(
    SupaValue<B, dynamic, String?> searchText, {
    String? config,
    TextSearchType? type,
  }) =>
      SupaTextSearchFilter(searchText, config, type, this);
}
