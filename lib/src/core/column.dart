import 'package:meta/meta.dart';
import 'package:typesafe_supabase/src/core/core.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaColumn}
///
/// Represents a column in a Supabase table.
///
/// `B` is the core class for the table.
///
/// `T` is the type of the value after conversion from the JSON.
///
/// `J` is the type of the value before conversion from the JSON.
///
/// {@endtemplate}
class SupaColumn<B extends SupaCore, T, J> {
  /// {@macro SupaColumn}
  const SupaColumn({
    required this.name,
    this.valueToJSON,
    this.valueFromJSON,
  });

  /// The name of the column.
  final String name;

  /// The function to convert the value to the correct type for the JSON.
  ///
  /// By default, the value will not be converted.
  final J Function(T value)? valueToJSON;

  /// The function to convert the value from the JSON to the correct type.
  ///
  /// By default, the value will not be converted.
  final T Function(J value)? valueFromJSON;

  /// Creates value for the table from the given [value].
  @mustBeOverridden
  SupaValue<B, T, J> call(T value) => SupaValue(
        value: value,
        name: name,
        valueToJSON: valueToJSON,
        valueFromJSON: valueFromJSON,
      );

  /// Fetches the value of the column from the JSON.
  ///
  /// Throws an exception if the column is not found in the JSON.
  T fromJSON(Map<String, dynamic> json) {
    if (!json.containsKey(name)) {
      throw Exception('Column $name not found in JSON.');
    }
    return valueFromJSON?.call(json[name] as J) ?? json[name] as T;
  }
}
