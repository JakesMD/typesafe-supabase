import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaColumnBase}
///
/// The base class for all [SupaColumn] and [SupaTableJoin] classes.
///
/// This allows both [SupaColumn] and [SupaTableJoin] to be used in the same
/// query.
///
/// {@endtemplate}
class SupaColumnBase<B extends SupaCore> {
  /// {@macro SupaColumnBase}
  const SupaColumnBase({required this.queryPattern});

  /// The query pattern for this column in the select() query.
  final String queryPattern;
}
