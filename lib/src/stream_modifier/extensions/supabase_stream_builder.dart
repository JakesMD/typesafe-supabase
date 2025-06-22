import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

@internal
extension SupaSupabaseStreamBuilderX on SupabaseStreamBuilder {
  /// Applies the provided [SupaStreamModifier] to the stream builder.
  SupabaseStreamBuilder applySupaModifier<TableType, CurrentType, PreviousType>(
    SupaStreamModifier<TableType, CurrentType, PreviousType> modifier,
  ) {
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
