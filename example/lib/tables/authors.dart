import 'package:typesafe_supabase/typesafe_supabase.dart';

part 'authors.g.dart';

/// {@template Authors}
///
/// Represents the `authors` table in the Supabase database.
///
/// {@endtemplate}
@SupaTableHere()
class Authors extends SupaTable<AuthorsCore, AuthorsRecord> {
  /// {@macro Authors}
  const Authors({required super.supabaseClient})
      : super(AuthorsRecord.new, tableName: 'authors', primaryKey: 'id');

  /// The unique identifier of the author.
  @SupaColumnHere<BigInt>(hasDefault: true)
  static const id = SupaColumn<AuthorsCore, BigInt, int>(name: 'id');

  /// The author's name.
  @SupaColumnHere<String>()
  static const name = SupaColumn<AuthorsCore, String, String>(name: 'name');
}
