import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaCSVModifier}
///
/// ### Retrieve as a CSV
///
/// Retrieves the response as a CSV string.
///
/// {@endtemplate}
class SupaCSVModifier<B extends SupaCore, R extends SupaRecord<B>>
    extends SupaModifier<B, R, R, PostgrestTransformBuilder<String>,
        PostgrestTransformBuilder<dynamic>> {
  /// {@macro SupaCSVModifier}
  @internal
  const SupaCSVModifier(super.previousModifier);

  @override
  PostgrestTransformBuilder<String> build(
    PostgrestTransformBuilder<dynamic> builder,
  ) =>
      builder.csv();
}
