import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

export 'builder_extension.dart';
export 'mixin.dart';
export 'modifier_extensions.dart';
export 'modifiers/_modifiers.dart';

/// {@template SupaModifier}
///
/// Represents a modifier that can be applied to a Supabase query.
///
/// Filters work on the row level. That is, they allow you to return rows that
/// only match certain conditions without changing the shape of the rows.
/// Modifiers are everything that don't fit that definition—allowing you to
/// change the format of the response (e.g., returning a CSV string).
///
/// Modifiers must be specified after filters.
///
/// `B` is the core class of the table.
///
/// `R` is the type of the record.
///
/// `T` is the type of the response after the modifier is applied.
///
/// `O` is the type of the PostgrestTransformBuilder after the modifier is
/// applied.
///
/// `I` is the type of the PostgrestTransformBuilder before the modifier is
/// applied.
///
/// {@endtemplate}
class SupaModifier<B extends SupaCore, R extends SupaRecord<B>, T, O, I> {
  /// {@macro SupaModifier}
  @internal
  const SupaModifier(this.previousModifier);

  /// The modifier that was applied before this one.
  final SupaModifier<B, R, dynamic, I, dynamic>? previousModifier;

  /// Cascades the Supabase modifier onto the provided [builder].
  @mustBeOverridden
  @internal
  PostgrestTransformBuilder<O> build(
    PostgrestTransformBuilder<I> builder,
  ) =>
      builder as PostgrestTransformBuilder<O>;
}
