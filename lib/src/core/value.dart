import 'package:typesafe_supabase/src/core/core.dart';

/// {@template SupaValue}
///
/// Represents a value that is stored within a record from a Supabase table.
///
/// `B` is the core class for the table.
///
/// `T` is the type of the value after conversion from the JSON.
///
/// `J` is the type of the value before conversion from the JSON.
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
  J toJSONValue() {
    if (valueToJSON != null) return valueToJSON!(value);
    if (value is BigInt || value is BigInt?) {
      return _toSpecificType<BigInt>(value, (value) => value.toInt());
    }
    if (value is DateTime || value is DateTime?) {
      return _toSpecificType<DateTime>(
        value,
        (value) => value.toIso8601String(),
      );
    }
    return value as J;
  }

  J _toSpecificType<M>(dynamic value, dynamic Function(M) parser) {
    if (value is M) return parser(value) as J;
    return value != null ? parser(value as M) as J : null as J;
  }

  /// Converts the value to a JSON object.
  Map<String, dynamic> toJSON() => {name: toJSONValue()};
}
