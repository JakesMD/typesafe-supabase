// ignore_for_file: avoid_positional_boolean_parameters

import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaLimitModifier}
///
/// ### Limit the number of rows returned
///
/// Limits the result with the specified count.
///
/// `count`: The maximum number of rows to return.
///
/// {@endtemplate}
class SupaLimitModifier<B extends SupaCore, R extends SupaRecord<B>>
    extends SupaModifier<B, R, List<R>, List<Map<String, dynamic>>,
        List<Map<String, dynamic>>> {
  /// {@macro SupaLimitModifier}
  @internal
  const SupaLimitModifier(this.count, super.previousModifier);

  /// The maximum number of rows to return.
  final int count;

  @override
  PostgrestTransformBuilder<List<Map<String, dynamic>>> build(
    PostgrestTransformBuilder<List<Map<String, dynamic>>> builder,
  ) =>
      builder.limit(count);
}
