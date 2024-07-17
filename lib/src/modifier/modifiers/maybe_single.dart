// ignore_for_file: avoid_positional_boolean_parameters

import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaMaybeSingleModifier}
///
/// ### Retrieve zero or one row of data
///
/// Retrieves only one row from the result if there is one.
///
/// {@endtemplate}
class SupaMaybeSingleModifier<B extends SupaCore, R extends SupaRecord<B>>
    extends SupaModifier<B, R, R?, Map<String, dynamic>?,
        List<Map<String, dynamic>>> {
  /// {@macro SupaMaybeSingleModifier}
  @internal
  const SupaMaybeSingleModifier(super.previousModifier);

  @override
  PostgrestTransformBuilder<Map<String, dynamic>?> build(
    PostgrestTransformBuilder<List<Map<String, dynamic>>> builder,
  ) =>
      builder.maybeSingle();
}
