import 'package:typesafe_supabase/typesafe_supabase.dart';

/// A mixin that provides stream filters.
mixin SupaStreamFilterMixin<B extends SupaCore> {
  /// {@macro SupaEqualFilter}
  SupaStreamFilter<B> sEqual(SupaValue<B, dynamic, dynamic> value) =>
      SupaEqualStreamFilter(value);

  /// {@macro SupaGreaterFilter}
  SupaStreamFilter<B> sGreater(SupaValue<B, dynamic, num?> value) =>
      SupaGreaterStreamFilter(value);

  /// {@macro SupaGreaterOrEqualFilter}
  SupaStreamFilter<B> sGreaterOrEqual(SupaValue<B, dynamic, num?> value) =>
      SupaGreaterOrEqualStreamFilter(value);

  /// {@macro SupaIncludedInFilter}
  SupaStreamFilter<B> sIncludedIn<J>(
    SupaColumn<B, dynamic, List<J>?> column,
    List<J> values,
  ) =>
      SupaIncludedInStreamFilter(column, values);

  /// {@macro SupaLessFilter}
  SupaStreamFilter<B> sLess(SupaValue<B, dynamic, num?> value) =>
      SupaLessStreamFilter(value);

  /// {@macro SupaLessOrEqualFilter}
  SupaStreamFilter<B> sLessOrEqual(SupaValue<B, dynamic, num?> value) =>
      SupaLessOrEqualStreamFilter(value);

  /// {@macro SupaNotEqualFilter}
  SupaStreamFilter<B> sNotEqual(SupaValue<B, dynamic, dynamic> value) =>
      SupaNotEqualStreamFilter(value);
}
