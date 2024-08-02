import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaAllModifier}
///
/// A modifier that does not modify the query but returns all possible records.
///
/// This is required in order to refer `T`.
///
/// {@endtemplate}
class SupaAllModifier<B extends SupaCore, R extends SupaRecord<B>>
    extends SupaModifier<
        B,
        R,
        List<R>,
        PostgrestTransformBuilder<List<Map<String, dynamic>>>,
        PostgrestTransformBuilder<List<Map<String, dynamic>>>> {
  /// {@macro SupaAllModifier}
  @internal
  const SupaAllModifier() : super(null);

  @override
  PostgrestTransformBuilder<List<Map<String, dynamic>>> build(
    PostgrestTransformBuilder<List<Map<String, dynamic>>> builder,
  ) =>
      builder;
}
