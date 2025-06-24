import 'package:typesafe_supabase/typesafe_supabase.dart';

/// Provides stream modifiers that can be chained onto a list stream modifier.
extension SupaListStreamModifierX<TableType>
    on SupaStreamModifier<TableType, PgJsonList, dynamic> {
  /// {@macro typesafe_postgrest.PgLimitModifier}
  SupaLimitStreamModifier<TableType> limitStream(int count) =>
      SupaLimitStreamModifier(this, count);

  /// {@macro typesafe_postgrest.PgOrderModifier}
  SupaOrderStreamModifier<TableType> orderStream(
          PgColumn<TableType, dynamic, dynamic> column,
          {bool ascending = false}) =>
      SupaOrderStreamModifier(this, column, ascending);
}
