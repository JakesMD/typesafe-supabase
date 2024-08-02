import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaSingleModifier}
///
/// ### Retrieve one row of data
///
/// Retrieves only one row from the result. Result must be one row (e.g. using
/// limit), otherwise this will result in an error.
///
/// {@endtemplate}
class SupaSingleModifier<B extends SupaCore, R extends SupaRecord<B>>
    extends SupaModifier<
        B,
        R,
        R,
        PostgrestTransformBuilder<Map<String, dynamic>>,
        PostgrestTransformBuilder<List<Map<String, dynamic>>>> {
  /// {@macro SupaSingleModifier}
  @internal
  const SupaSingleModifier(super.previousModifier);

  @override
  PostgrestTransformBuilder<Map<String, dynamic>> build(
    PostgrestTransformBuilder<List<Map<String, dynamic>>> builder,
  ) =>
      builder.single();
}
