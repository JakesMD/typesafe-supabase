import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaRangeGreaterFilter}
///
/// ### Greater than a range
///
/// Only relevant for range columns. A filter that only
/// matches rows where every element in the [column] is greater than any
/// element in range from [lowerBound] to [upperBound].
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
class SupaRangeGreaterFilter<B extends SupaCore, J extends Object>
    extends SupaFilter<B> {
  /// {@macro SupaRangeGreaterFilter}
  @internal
  const SupaRangeGreaterFilter(
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
      builder.rangeGt(
        column.name,
        rangeType.patternFromBounds(upperBound, lowerBound),
      );
}
