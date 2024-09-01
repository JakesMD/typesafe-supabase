import 'package:typesafe_supabase/src/core/exception.dart';
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
    if (_json[reference.tableName] is Map) {
      return [referenceSingle(reference)!];
    }

    if (!_json.containsKey(reference.tableName)) {
      throw SupaException.missingColumn(reference.tableName);
    }

    if (_json[reference.tableName] == null) return [];

    return (_json[reference.tableName] as List<dynamic>)
        .map((e) => reference.record(Map<String, dynamic>.from(e as Map)) as R)
        .toList();
  }

  /// Fetches a single record from the given reference.
  R? referenceSingle<A extends SupaCore, R extends SupaRecord<A>>(
    SupaTableJoin<B, A> reference,
  ) {
    if (!_json.containsKey(reference.tableName)) {
      throw SupaException.missingColumn(reference.tableName);
    }

    if (_json[reference.tableName] == null) return null;

    return reference.record(
      Map<String, dynamic>.from(_json[reference.tableName] as Map),
    ) as R;
  }
}
