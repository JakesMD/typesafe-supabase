/// Represents the type of range.
enum SupaRangeType {
  /// Inclusive lower bound and inclusive upper bound.
  ///
  /// Example: [1, 10]
  inclusiveInclusive,

  /// Inclusive lower bound and exclusive upper bound.
  ///
  /// Example: [1, 10)
  inclusiveExclusive,

  /// Exclusive lower bound and inclusive upper bound.
  ///
  /// Example: (1, 10]
  exclusiveInclusive,

  /// Exclusive lower bound and exclusive upper bound.
  ///
  /// Example: (1, 10)
  exclusiveExclusive;

  /// Returns the filter pattern for the range type with the provided bounds.
  String patternFromBounds<J extends Object>(J upperBound, J lowerBound) {
    switch (this) {
      case SupaRangeType.inclusiveInclusive:
        return '[$lowerBound,$upperBound]';
      case SupaRangeType.inclusiveExclusive:
        return '[$lowerBound,$upperBound)';
      case SupaRangeType.exclusiveInclusive:
        return '($lowerBound,$upperBound]';
      case SupaRangeType.exclusiveExclusive:
        return '($lowerBound,$upperBound)';
    }
  }
}
