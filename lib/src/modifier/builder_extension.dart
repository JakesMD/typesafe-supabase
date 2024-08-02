import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

@internal
extension SupaModifierBuilder
    on PostgrestTransformBuilder<List<Map<String, dynamic>>> {
  O supaApplyModifier<B extends SupaCore, R extends SupaRecord<B>,
      O extends PostgrestBuilder<dynamic, dynamic, dynamic>>(
    SupaModifier<B, R, dynamic, O, PostgrestBuilder<dynamic, dynamic, dynamic>>
        modifier,
  ) {
    final modifiers = <SupaModifier<
        B,
        R,
        dynamic,
        PostgrestBuilder<dynamic, dynamic, dynamic>,
        PostgrestBuilder<dynamic, dynamic, dynamic>>>[];
    SupaModifier<B, R, dynamic, PostgrestBuilder<dynamic, dynamic, dynamic>,
        PostgrestBuilder<dynamic, dynamic, dynamic>>? current = modifier;

    while (current != null) {
      modifiers.insert(0, current);
      current = current.previousModifier;
    }

    return modifiers.fold<PostgrestBuilder<dynamic, dynamic, dynamic>>(
      this,
      (prev, modifier) => modifier.build(prev),
    ) as O;
  }
}
