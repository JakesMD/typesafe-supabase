import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaRangeGreaterOrEqualFilter}
///
/// ### Greater than or equal to a range
///
/// Only relevant for range columns. A filter that only
/// matches rows where every element in the [column] is either contained in or
/// greater than any element in the range from [lowerBound] to [upperBound].
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
class SupaRangeGreaterOrEqualFilter<B extends SupaCore, J extends Object>
    extends SupaFilter<B> {
  /// {@macro SupaRangeGreaterOrEqualFilter}
  @internal
  const SupaRangeGreaterOrEqualFilter(
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
      builder.rangeGte(
        column.name,
        rangeType.patternFromBounds(upperBound, lowerBound),
      );
}
