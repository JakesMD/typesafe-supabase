import 'package:meta/meta.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaColumn}
///
/// Represents a column in a Supabase table.
///
/// {@endtemplate}
class SupaColumn<T, V extends SupaValue<T>> {
  /// {@macro SupaColumn}
  const SupaColumn({
    required this.name,
    required this.valueToJSON,
    required this.valueFromJSON,
  });

  /// The name of the column.
  final String name;

  /// The function to convert the value to the correct type for the JSON.
  ///
  /// By default, the value will not be converted.
  final dynamic Function(T value)? valueToJSON;

  /// The function to convert the value from the JSON to the correct type.
  ///
  /// By default, the value will not be converted.
  final T Function(dynamic value)? valueFromJSON;

  /// Creates value for the table from the given [value].
  @mustBeOverridden
  V call(T value) => SupaValue(
        value: value,
        name: name,
        valueToJSON: valueToJSON,
        valueFromJSON: valueFromJSON,
      ) as V;

  /// Fetches the value of the column from the JSON.
  ///
  /// Throws an exception if the column is not found in the JSON.
  T fromJSON(Map<String, dynamic> json) {
    if (!json.containsKey(name)) {
      throw Exception('Column $name not found in JSON.');
    }
    return valueFromJSON?.call(json[name]) ?? json[name] as T;
  }
}
