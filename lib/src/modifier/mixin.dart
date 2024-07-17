import 'package:typesafe_supabase/typesafe_supabase.dart';

/// A mixin that provides modifiers.
mixin SupaModifierMixin<B extends SupaCore, R extends SupaRecord<B>> {
  /// {@macro SupaCSVModifier}
  SupaCSVModifier<B, R> csv() => const SupaCSVModifier(null);

  /// {@macro SupaLimitModifier}
  SupaLimitModifier<B, R> limit(int count) => SupaLimitModifier(count, null);

  /// {@macro SupaMaybeSingleModifier}
  SupaMaybeSingleModifier<B, R> maybeSingle() =>
      const SupaMaybeSingleModifier(null);

  /// {@macro SupaOrderModifier}
  SupaNoModifier<B, R> none() => const SupaNoModifier();

  /// {@macro SupaOrderModifier}
  SupaOrderModifier<B, R> order(
    SupaColumn<B, dynamic, dynamic> column, {
    bool ascending = true,
    bool nullsFirst = false,
  }) =>
      SupaOrderModifier(column, ascending, nullsFirst, null);

  /// {@macro SupaRangeModifier}
  SupaRangeModifier<B, R> range(int from, int to) =>
      SupaRangeModifier(from, to, null);

  /// {@macro SupaSingleModifier}
  SupaSingleModifier<B, R> single() => const SupaSingleModifier(null);
}
