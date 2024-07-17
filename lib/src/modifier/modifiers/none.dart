// ignore_for_file: avoid_positional_boolean_parameters

import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaNoModifier}
///
/// A modifier that does not modify the query. Used for when no modifier is
/// provided.
///
/// {@endtemplate}
class SupaNoModifier<B extends SupaCore, R extends SupaRecord<B>>
    extends SupaModifier<B, R, List<R>, List<Map<String, dynamic>>,
        List<Map<String, dynamic>>> {
  /// {@macro SupaNoModifier}
  @internal
  const SupaNoModifier() : super(null);

  @override
  PostgrestTransformBuilder<List<Map<String, dynamic>>> build(
    PostgrestTransformBuilder<List<Map<String, dynamic>>> builder,
  ) =>
      builder;
}
