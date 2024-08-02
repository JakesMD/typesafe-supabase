import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaNoneModifier}
///
/// A modifier that does not modify the query. Used for when no data needs to be
/// retrieved.
///
/// This is required in order to refer `T`.
///
/// {@endtemplate}
class SupaNoneModifier<B extends SupaCore, R extends SupaRecord<B>>
    extends SupaModifier<B, R, void, PostgrestTransformBuilder<void>,
        PostgrestTransformBuilder<void>> {
  /// {@macro SupaNoneModifier}
  @internal
  const SupaNoneModifier() : super(null);

  @override
  PostgrestTransformBuilder<void> build(
    PostgrestTransformBuilder<void> builder,
  ) =>
      builder;
}
