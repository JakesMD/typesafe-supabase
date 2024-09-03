import 'package:typesafe_supabase/src/core/core.dart';
import 'package:typesafe_supabase/src/core/exception.dart';
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
class SupaColumn<B extends SupaCore, T, J> extends SupaColumnBase<B> {
  /// {@macro SupaColumn}
  const SupaColumn({
    required this.name,
    this.valueToJSON,
    this.valueFromJSON,
  }) : super(queryPattern: name);

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
    if (!json.containsKey(name)) throw SupaException.missingColumn(name);

    if (valueFromJSON != null) return valueFromJSON!(json[name] as J);
    if (T is BigInt || T is BigInt?) {
      return _fromSpecificType(
        json[name],
        (value) => BigInt.from(value as int),
      );
    }

    if (T is DateTime || T is DateTime?) {
      return _fromSpecificType(
        json[name],
        (value) => DateTime.parse(value as String),
      );
    }

    return json[name] as T;
  }

  T _fromSpecificType<M>(dynamic value, M Function(dynamic) parser) {
    if (T is M) return parser(value) as T;
    return value != null ? parser(value) as T : null as T;
  }
}
