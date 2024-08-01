// ignore_for_file: avoid_positional_boolean_parameters

import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaAllModifier}
///
/// A modifier that does not modify the query but returns all possible records.
///
/// {@endtemplate}
class SupaAllModifier<B extends SupaCore, R extends SupaRecord<B>>
    extends SupaModifier<B, R, List<R>, List<Map<String, dynamic>>,
        List<Map<String, dynamic>>> {
  /// {@macro SupaAllModifier}
  @internal
  const SupaAllModifier() : super(null);

  @override
  PostgrestTransformBuilder<List<Map<String, dynamic>>> build(
    PostgrestTransformBuilder<List<Map<String, dynamic>>> builder,
  ) =>
      builder;
}
