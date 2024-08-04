import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@macro SupaLimitModifier}
class SupaLimitStreamModifier<B extends SupaCore, R extends SupaRecord<B>>
    extends SupaStreamModifier<B, R> {
  /// {@macro SupaLimitModifier}
  @internal
  const SupaLimitStreamModifier(this.count, super.previousModifier);

  /// The maximum number of rows to return.
  final int count;

  @override
  SupabaseStreamBuilder build(SupabaseStreamBuilder builder) =>
      builder.limit(count);
}
