import 'package:typesafe_supabase/typesafe_supabase.dart';

/// Provides stream modifiers that can start the modifier chain.
extension SupabaseTableModifierX<TableType> on SupabaseTable<TableType> {
  /// {@macro typesafe_postgrest.PgLimitModifier}
  SupaLimitStreamModifier<TableType> limitStream(int count) =>
      SupaLimitStreamModifier(null, count);

  /// {@macro typesafe_postgrest.PgOrderModifier}
  SupaOrderStreamModifier<TableType> orderStream(
          PgColumn<TableType, dynamic, dynamic> column,
          {bool ascending = false}) =>
      SupaOrderStreamModifier(null, column, ascending);
}
