// ignore_for_file: avoid_positional_boolean_parameters

import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaOrderModifier}
///
/// ### Order the results
///
/// Orders the result with the specified [column].
///
/// `column`: The column to order by.
///
/// `ascending`: Whether to order in ascending order.
///
/// `nullsFirst`: Whether to order nulls first.
///
/// {@endtemplate}
class SupaOrderModifier<B extends SupaCore, R extends SupaRecord<B>>
    extends SupaModifier<
        B,
        R,
        List<R>,
        PostgrestTransformBuilder<List<Map<String, dynamic>>>,
        PostgrestTransformBuilder<List<Map<String, dynamic>>>> {
  /// {@macro SupaOrderModifier}
  @internal
  const SupaOrderModifier(
    this.column,
    this.ascending,
    this.nullsFirst,
    super.previousModifier,
  );

  /// The column to order by.
  final SupaColumn<B, dynamic, dynamic> column;

  /// Whether to order in ascending order.
  final bool ascending;

  /// Whether to order nulls first.
  final bool nullsFirst;

  @override
  PostgrestTransformBuilder<List<Map<String, dynamic>>> build(
    PostgrestTransformBuilder<List<Map<String, dynamic>>> builder,
  ) =>
      builder.order(
        column.name,
        ascending: ascending,
        nullsFirst: nullsFirst,
      );
}
