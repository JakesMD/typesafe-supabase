import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaCountResponse}
///
/// A response from a `SupaCountModifier` containing the number of records in
/// the response and the records themselves.
///
/// {@endtemplate}
class SupaCountResponse<B extends SupaCore, R extends SupaRecord<B>> {
  /// {@macro SupaCountResponse}
  const SupaCountResponse({
    required this.count,
    required this.records,
  });

  /// The number of records in the response.
  final int count;

  /// The records in the response.
  final List<R> records;
}
