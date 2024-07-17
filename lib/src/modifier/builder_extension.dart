import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

@internal
extension SupaModifierBuilder on PostgrestTransformBuilder<dynamic> {
  PostgrestTransformBuilder<T>
      supaApplyModifier<B extends SupaCore, R extends SupaRecord<B>, T>(
    SupaModifier<B, R, dynamic, T, dynamic> modifier,
  ) {
    final modifiers = <SupaModifier<B, R, dynamic, dynamic, dynamic>>[];
    SupaModifier<B, R, dynamic, dynamic, dynamic>? current = modifier;

    while (current != null) {
      modifiers.insert(0, current);
      current = current.previousModifier;
    }

    return modifiers.fold(
      this,
      (prev, modifier) => modifier.build(prev),
    ) as PostgrestTransformBuilder<T>;
  }
}
