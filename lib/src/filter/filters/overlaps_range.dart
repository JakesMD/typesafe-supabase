import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaOverlapsRangeFilter}
///
/// ### Range with a common element
///
/// Only relevant for range columns. A filter that only
/// matches rows where the [column] and range from [lowerBound] to [upperBound]
/// have an element in common.
///
/// `column`: The range column to filter on.
///
/// `lowerBound`: The lower range value to filter with.
///
/// `upperBound`: The upper range value to filter with.
///
/// `rangeType`: The range type to filter with.
///
/// {@endtemplate}
class SupaOverlapsRangeFilter<B extends SupaCore, J extends Object>
    extends SupaFilter<B> {
  /// {@macro SupaOverlapsRangeFilter}
  @internal
  const SupaOverlapsRangeFilter(
    this.column,
    this.lowerBound,
    this.upperBound,
    this.rangeType,
    super.previousFilter,
  );

  /// The range column to filter on.
  final SupaColumn<B, dynamic, dynamic> column;

  /// The lower range value to filter with.
  final J lowerBound;

  /// The upper range value to filter with.
  final J upperBound;

  /// The range type to filter with.
  final SupaRangeType rangeType;

  @override
  PostgrestFilterBuilder<P> build<P>(PostgrestFilterBuilder<P> builder) =>
      builder.overlaps(
        column.name,
        rangeType.patternFromBounds(upperBound, lowerBound),
      );
}
