import 'package:meta/meta.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaInsert}
///
/// Represents an insert operation on a Supabase table.
///
/// {@endtemplate}
class SupaInsert<T extends SupaTable<C, V>, C extends SupaColumn<dynamic, V>,
    V extends SupaValue<dynamic>> {
  /// {@macro SupaInsert}
  const SupaInsert();

  /// The values to insert into the table.
  @mustBeOverridden
  Set<V> values(T table) => {};

  /// Converts the insert operation to JSON.
  Map<String, dynamic> toJSON(T table) =>
      values(table).fold<Map<String, dynamic>>(
        {},
        (prev, value) => prev..addAll(value.toJSON()),
      );
}
