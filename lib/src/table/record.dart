import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaRecord}
///
/// Represents a record fetched from a Supabase table.
///
/// {@endtemplate}
class SupaRecord<C extends SupaColumn<dynamic, V>,
    V extends SupaValue<dynamic>> {
  /// {@macro SupaRecord}
  const SupaRecord(Map<String, dynamic> json) : _json = json;

  final Map<String, dynamic> _json;

  /// Fetches the value of the given column from the record.
  T call<T>(C column) => column.fromJSON(_json) as T;
}
