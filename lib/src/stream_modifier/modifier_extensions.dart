// ignore_for_file: use_to_and_as_if_applicable

import 'package:typesafe_supabase/typesafe_supabase.dart';

/// An extension on a [SupaStreamModifier].
extension SupaStreamModifierExtension<B extends SupaCore,
    R extends SupaRecord<B>> on SupaStreamModifier<B, R> {
  /// {@macro SupaLimitModifier}
  SupaLimitStreamModifier<B, R> sLimit(int count) =>
      SupaLimitStreamModifier(count, this);

  /// {@macro SupaOrderModifier}
  SupaOrderStreamModifier<B, R> sOrder(
    SupaColumn<B, dynamic, dynamic> column, {
    bool ascending = true,
  }) =>
      SupaOrderStreamModifier(column, ascending, this);
}
