// Internal API
// ignore_for_file: avoid_positional_boolean_parameters

import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@macro typesafe_postgrest.PgOrderModifier}
class SupaOrderStreamModifier<TableType>
    extends SupaStreamModifier<TableType, PgJsonList, PgJsonList> {
  /// {@macro typesafe_postgrest.PgOrderModifier}
  @internal
  const SupaOrderStreamModifier(
      super.previousModifier, this.column, this.ascending);

  /// The column to order by.
  final PgColumn<TableType, dynamic, dynamic> column;

  /// Whether to order in ascending order.
  final bool ascending;

  @override
  @internal
  SupabaseStreamBuilder build(SupabaseStreamBuilder builder) =>
      builder.order(column.name, ascending: ascending);
}
