import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaTable}
///
/// An annotation to let the generator know that the class is a Supabase table.
///
/// {@endtemplate}
class SupaTableHere {
  /// {@macro SupaTable}
  const SupaTableHere([this.prefix]);

  /// Your preferred class prefix for the generated classes.
  ///
  /// If not provided, the name of the class will be used as the prefix.
  ///
  /// E.g. `Books` --> `BooksColumn`, `BooksColumnValue`, ...
  final String? prefix;
}

/// {@template SupaColumn}
///
/// An annotation to let the generator know that the field is a column of a
/// Supabase table.
///
/// Provide `T` to specify the type of the column. (e.g. `@SupaColumnHere<int>`)
///
/// {@endtemplate}
class SupaColumnHere<T> {
  /// {@macro SupaColumn}
  const SupaColumnHere({this.hasDefault = false});

  /// Whether the column has a default value which is set by the database.
  ///
  /// This is often the case for columns like 'id', 'created_at', ...
  ///
  /// This is not required for nullable types.
  ///
  /// Setting this makes the value optional in the [SupaInsert].
  final bool hasDefault;
}
