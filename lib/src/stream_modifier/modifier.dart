import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

export 'builder_extension.dart';
export 'mixin.dart';
export 'modifier_extensions.dart';
export 'modifiers/_modifiers.dart';

/// {@template SupaStreamModifier}
///
/// Represents a modifier that can be applied to a Supabase stream query.
///
/// Filters work on the row level. That is, they allow you to return rows that
/// only match certain conditions without changing the shape of the rows.
/// Modifiers are everything that don't fit that definition.
///
/// Modifiers must be specified after filters.
///
/// The response is always a stream of a list of records.
///
/// {@endtemplate}
class SupaStreamModifier<B extends SupaCore, R extends SupaRecord<B>> {
  /// {@macro SupaStreamModifier}
  @internal
  const SupaStreamModifier(this.previousModifier);

  /// The modifier that was applied before this one.
  final SupaStreamModifier<B, R>? previousModifier;

  /// Cascades the Supabase modifier onto the provided [builder].
  @mustBeOverridden
  @internal
  SupabaseStreamBuilder build(SupabaseStreamBuilder builder) => builder;
}
