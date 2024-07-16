import 'package:typesafe_supabase/typesafe_supabase.dart';

part 'books.g.dart';

/// {@template Books}
///
/// Represents the `books` table in the Supabase database.
///
/// {@endtemplate}
@SupaTableHere()
class Books extends SupaTable<BooksCore, BooksRecord> {
  /// {@macro Books}
  const Books({required super.supabaseClient})
      : super(BooksRecord._, tableName: 'books', primaryKey: 'id');

  /// The unique identifier of the book.
  @SupaColumnHere<BigInt>(hasDefault: true)
  static final id = SupaColumn<BooksCore, BigInt, int>(
    name: 'id',
    valueFromJSON: BigInt.from,
    valueToJSON: (v) => v.toInt(),
  );

  /// The title of the book.
  @SupaColumnHere<String>()
  static const title = SupaColumn<BooksCore, String, String>(name: 'title');

  /// The author of the book.
  @SupaColumnHere<String>()
  static const author = SupaColumn<BooksCore, String, String>(name: 'author');

  /// The number of pages in the book.
  @SupaColumnHere<int?>()
  static const pages = SupaColumn<BooksCore, int?, int?>(name: 'pages');
}
