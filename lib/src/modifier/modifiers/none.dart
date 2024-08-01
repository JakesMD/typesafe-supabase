// ignore_for_file: avoid_positional_boolean_parameters

import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaNoneModifier}
///
/// A modifier that does not modify the query. Used for when no modifier is
/// provided.
///
/// {@endtemplate}
class SupaNoneModifier<B extends SupaCore, R extends SupaRecord<B>>
    extends SupaModifier<B, R, void, void, void> {
  /// {@macro SupaNoneModifier}
  @internal
  const SupaNoneModifier() : super(null);

  @override
  PostgrestTransformBuilder<void> build(
    PostgrestTransformBuilder<void> builder,
  ) =>
      builder;
}
