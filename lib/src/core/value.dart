import 'package:typesafe_supabase/src/core/core.dart';

/// {@template SupaValue}
///
/// Represents a value that is stored within a record from a Supabase table.
///
/// {@endtemplate}
class SupaValue<B extends SupaCore, T, J> {
  /// {@macro SupaValue}
  const SupaValue({
    required this.value,
    required this.name,
    required this.valueToJSON,
    required this.valueFromJSON,
  });

  /// The name of the column in the table.
  final String name;

  /// The value.
  final T value;

  /// The function to convert the value to the correct type for the JSON.
  ///
  /// By default, the value will not be converted.
  final J Function(T value)? valueToJSON;

  /// The function to convert the value from the JSON to the correct type.
  ///
  /// By default, the value will not be converted.
  final T Function(J value)? valueFromJSON;

  /// Returns the converted value ready for JSON.
  J toJSONValue() => valueToJSON?.call(value) ?? value as J;

  /// Converts the value to a JSON object.
  Map<String, dynamic> toJSON() => {name: toJSONValue()};
}
