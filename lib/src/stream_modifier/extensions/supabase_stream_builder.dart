import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

@internal
extension SupaSupabaseStreamBuilderX on SupabaseStreamBuilder {
  SupabaseStreamBuilder
      applySupaStreamModifier<TableType, CurrentType, PreviousType>(
    SupaStreamModifier<TableType, CurrentType, PreviousType>? modifier,
  ) {
    if (modifier == null) return this;

    final modifiers = <SupaStreamModifier<TableType, dynamic, dynamic>>[];

    SupaStreamModifier<TableType, dynamic, dynamic>? current = modifier;

    while (current != null) {
      modifiers.insert(0, current);
      current = current.previousModifier;
    }

    return modifiers.fold<SupabaseStreamBuilder>(
        this, (prev, modifier) => modifier.build(prev).builder);
  }
}
