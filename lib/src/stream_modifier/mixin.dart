import 'package:typesafe_supabase/typesafe_supabase.dart';

/// A mixin that provides modifiers.
mixin SupaStreamModifierMixin<B extends SupaCore, R extends SupaRecord<B>> {
  /// {@macro SupaLimitModifier}
  SupaLimitStreamModifier<B, R> sLimit(int count) =>
      SupaLimitStreamModifier(count, null);

  /// {@macro SupaOrderModifier}
  SupaOrderStreamModifier<B, R> sOrder(
    SupaColumn<B, dynamic, dynamic> column, {
    bool ascending = true,
  }) =>
      SupaOrderStreamModifier(column, ascending, null);
}
