import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';

/// {@template typesafe_supabase.SupaStreamModifierBuilder}
///
/// A wrapper around a [SupabaseStreamBuilder] that allows for differing types.
///
/// [OutputType] is the type of the stream that will be returned.
///
/// {@endtemplate}
@internal
class SupaStreamModifierBuilder<OutputType> {
  /// {@macro typesafe_supabase.SupaStreamModifierBuilder}
  const SupaStreamModifierBuilder(this.builder);

  /// The stream builder that will generate the query.
  final SupabaseStreamBuilder builder;
}
