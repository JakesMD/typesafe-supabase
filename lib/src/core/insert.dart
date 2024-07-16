import 'package:meta/meta.dart';
import 'package:typesafe_supabase/src/core/core.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaInsert}
///
/// Represents an insert operation on a Supabase table.
///
/// {@endtemplate}
class SupaInsert<B extends SupaCore> {
  /// {@macro SupaInsert}
  const SupaInsert();

  /// The values to insert into the table.
  @mustBeOverridden
  Set<SupaValue<B, dynamic, dynamic>> get values => {};

  /// Converts the insert operation to JSON.
  Map<String, dynamic> toJSON() => values.fold<Map<String, dynamic>>(
        {},
        (prev, value) => prev..addAll(value.toJSON()),
      );
}
