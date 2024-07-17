// ignore_for_file: avoid_positional_boolean_parameters

import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaRangeModifier}
///
/// ### Limit the query to a range
///
/// Limits the result to rows within the specified range, inclusive.
///
/// `from`: The starting index from which to limit the result.
///
/// `to`: The last index to which to limit the result.
///
/// {@endtemplate}
class SupaRangeModifier<B extends SupaCore, R extends SupaRecord<B>>
    extends SupaModifier<B, R, List<R>, List<Map<String, dynamic>>,
        List<Map<String, dynamic>>> {
  /// {@macro SupaRangeModifier}
  @internal
  const SupaRangeModifier(this.from, this.to, super.previousModifier);

  /// The starting index from which to limit the result.
  final int from;

  /// The last index to which to limit the result.
  final int to;

  @override
  PostgrestTransformBuilder<List<Map<String, dynamic>>> build(
    PostgrestTransformBuilder<List<Map<String, dynamic>>> builder,
  ) =>
      builder.range(from, to);
}
