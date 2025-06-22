import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/src/stream_modifier/stream_modifier_builder.dart';

export 'extensions/_extensions.dart';
export 'stream_modifier_builder.dart';
export 'stream_modifiers/_stream_modifiers.dart';

/// {@template typesafe_supabase.SupaStreamModifier}
///
/// A modifier that can be applied to a stream.
///
/// {@macro typesafe_postgrest.PgModifier}
///
/// {@endtemplate}
class SupaStreamModifier<TableType, CurrentType, PreviousType> {
  /// {@macro typesafe_supabase.SupaStreamModifier}
  @internal
  const SupaStreamModifier(this.previousModifier);

  /// The modifier that was applied before this one.
  final SupaStreamModifier<TableType, PreviousType, dynamic>? previousModifier;

  /// Cascades the modifier onto the provided [builder].
  @mustBeOverridden
  @internal
  SupaStreamModifierBuilder<CurrentType> build(SupabaseStreamBuilder builder) =>
      SupaStreamModifierBuilder(builder);
}
