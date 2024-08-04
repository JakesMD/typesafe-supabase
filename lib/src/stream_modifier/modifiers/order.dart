// ignore_for_file: avoid_positional_boolean_parameters

import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@macro SupaOrderModifier}
class SupaOrderStreamModifier<B extends SupaCore, R extends SupaRecord<B>>
    extends SupaStreamModifier<B, R> {
  /// {@macro SupaOrderModifier}
  @internal
  const SupaOrderStreamModifier(
    this.column,
    this.ascending,
    super.previousModifier,
  );

  /// The column to order by.
  final SupaColumn<B, dynamic, dynamic> column;

  /// Whether to order in ascending order.
  final bool ascending;

  @override
  SupabaseStreamBuilder build(SupabaseStreamBuilder builder) =>
      builder.order(column.name, ascending: ascending);
}
