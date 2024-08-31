String _camelCase(String string) {
  final parts = string.split('_');
  final rest = parts.skip(1).map(
        (part) => part[0].toUpperCase() + part.substring(1),
      );
  return parts.first + rest.join();
}

/// {@template SupaException}
///
/// Represents an exception that occurred within the Supabase package.
///
/// {@endtemplate}
class SupaException implements Exception {
  /// {@macro SupaException}
  const SupaException({required this.message, required this.hint});

  /// Creates an exception for a missing column in the JSON data.
  SupaException.missingColumn(String columnName)
      : message = 'The column `$columnName` was not found in the JSON data.',
        hint =
            '''Make sure you added `columns: { YourTable.${_camelCase(columnName)} }` to your type-safe query.''';

  /// The message of the exception.
  final String message;

  /// A hint to help resolve the exception.
  final String hint;

  @override
  String toString() => 'SupaException(message: $message, hint: $hint)';
}
