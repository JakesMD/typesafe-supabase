/// {@template SupaValue}
///
/// Represents a value that is stored within a record from a Supabase table.
///
/// {@endtemplate}
class SupaValue<T> {
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
  final dynamic Function(T value)? valueToJSON;

  /// The function to convert the value from the JSON to the correct type.
  ///
  /// By default, the value will not be converted.
  final T Function(dynamic value)? valueFromJSON;

  /// Converts the value to a JSON object.
  Map<String, dynamic> toJSON() => {
        name: valueToJSON?.call(value) ??
            (value is BigInt ? value.toString() : value),
      };
}
