import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/src/stream_modifier/stream_modifier.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@macro typesafe_postgrest.PgLimitModifier}
class SupaLimitStreamModifier<TableType>
    extends SupaStreamModifier<TableType, PgJsonList, PgJsonList> {
  /// {@macro typesafe_postgrest.PgLimitModifier}
  @internal
  const SupaLimitStreamModifier(super.previousModifier, this.count);

  /// The maximum number of rows to return.
  final int count;

  @override
  @internal
  SupaStreamModifierBuilder<PgJsonList> build(SupabaseStreamBuilder builder) =>
      SupaStreamModifierBuilder(builder.limit(count));
}
