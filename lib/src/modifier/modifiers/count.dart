import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaCountModifier}
///
/// ### Count the number of records
///
/// Counts the number of records in the response.
///
/// {@endtemplate}
class SupaCountModifier<B extends SupaCore, R extends SupaRecord<B>>
    extends SupaModifier<
        B,
        R,
        SupaCountResponse<B, R>,
        ResponsePostgrestBuilder<PostgrestResponse<List<Map<String, dynamic>>>,
            List<Map<String, dynamic>>, List<Map<String, dynamic>>>,
        PostgrestTransformBuilder<List<Map<String, dynamic>>>> {
  /// {@macro SupaCountModifier}
  @internal
  const SupaCountModifier(this.option, super.previousModifier);

  /// The count option to use.
  final CountOption option;

  @override
  ResponsePostgrestBuilder<PostgrestResponse<List<Map<String, dynamic>>>,
      List<Map<String, dynamic>>, List<Map<String, dynamic>>> build(
    PostgrestTransformBuilder<List<Map<String, dynamic>>> builder,
  ) =>
      builder.count(option);
}
