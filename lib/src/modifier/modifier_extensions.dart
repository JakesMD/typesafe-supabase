// ignore_for_file: use_to_and_as_if_applicable

import 'package:typesafe_supabase/typesafe_supabase.dart';

/// An extension on [SupaModifier]s that return a list of records.
extension SupaListModifierExtension<B extends SupaCore, R extends SupaRecord<B>>
    on SupaModifier<B, R, dynamic, List<Map<String, dynamic>>, dynamic> {
  /// {@macro SupaCSVModifier}
  SupaCSVModifier<B, R> csv() => SupaCSVModifier(this);

  /// {@macro SupaLimitModifier}
  SupaLimitModifier<B, R> limit(int count) => SupaLimitModifier(count, this);

  /// {@macro SupaMaybeSingleModifier}
  SupaMaybeSingleModifier<B, R> maybeSingle() => SupaMaybeSingleModifier(this);

  /// {@macro SupaOrderModifier}
  SupaOrderModifier<B, R> order(
    SupaColumn<B, dynamic, dynamic> column, {
    bool ascending = true,
    bool nullsFirst = false,
  }) =>
      SupaOrderModifier(column, ascending, nullsFirst, this);

  /// {@macro SupaRangeModifier}
  SupaRangeModifier<B, R> range(int from, int to) =>
      SupaRangeModifier(from, to, this);

  /// {@macro SupaSingleModifier}
  SupaSingleModifier<B, R> single() => SupaSingleModifier(this);
}

/// An extension on [SupaModifier]s that return a single record.
extension SupaRecordModifierExtension<B extends SupaCore,
        R extends SupaRecord<B>>
    on SupaModifier<B, R, dynamic, Map<String, dynamic>, dynamic> {
  /// {@macro SupaCSVModifier}
  SupaCSVModifier<B, R> csv() => SupaCSVModifier(this);
}