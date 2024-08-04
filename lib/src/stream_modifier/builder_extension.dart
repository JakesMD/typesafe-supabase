import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

@internal
extension SupaStreamModifierBuilder on SupabaseStreamBuilder {
  SupabaseStreamBuilder
      supaApplyModifier<B extends SupaCore, R extends SupaRecord<B>>(
    SupaStreamModifier<B, R> modifier,
  ) {
    final modifiers = <SupaStreamModifier<B, R>>[];
    SupaStreamModifier<B, R>? current = modifier;

    while (current != null) {
      modifiers.insert(0, current);
      current = current.previousModifier;
    }

    return modifiers.fold(
      this,
      (prev, modifier) => modifier.build(prev),
    );
  }
}
