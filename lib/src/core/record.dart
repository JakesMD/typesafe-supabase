import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaRecord}
///
/// Represents a record fetched from a Supabase table.
///
/// {@endtemplate}
class SupaRecord<B extends SupaCore> {
  /// {@macro SupaRecord}
  const SupaRecord(Map<String, dynamic> json) : _json = json;

  final Map<String, dynamic> _json;

  /// Fetches the value of the given column from the record.
  T call<T, J>(SupaColumn<B, T, J> column) => column.fromJSON(_json);

  /// Fetches the list of records from the given reference.
  List<R> reference<A extends SupaCore, R extends SupaRecord<A>>(
    SupaTableJoin<B, A> reference,
  ) {
    if (_json[reference.tableName] is Map<String, dynamic>) {
      return [referenceSingle(reference)];
    }

    if (!_json.containsKey(reference.tableName) ||
        _json[reference.tableName] == null) {
      throw Exception(
        'Column ${reference.tableName} not found in JSON or null.',
      );
    }

    return (_json[reference.tableName] as List<Map<String, dynamic>>)
        .map((e) => reference.record(e) as R)
        .toList();
  }

  /// Fetches a single record from the given reference.
  R referenceSingle<A extends SupaCore, R extends SupaRecord<A>>(
    SupaTableJoin<B, A> reference,
  ) {
    if (!_json.containsKey(reference.tableName) ||
        _json[reference.tableName] == null) {
      throw Exception(
        'Column ${reference.tableName} not found in JSON or null.',
      );
    }

    return reference.record(_json[reference.tableName] as Map<String, dynamic>)
        as R;
  }
}
