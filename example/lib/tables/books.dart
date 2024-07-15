import 'package:typesafe_supabase/typesafe_supabase.dart';

part 'books.g.dart';

/// {@template Books}
///
/// Represents the `books` table in the Supabase database.
///
/// {@endtemplate}
@SupaTableHere()
class Books extends SupaTable<BooksColumn<dynamic>, BooksColumnValue<dynamic>,
    BooksRecord> {
  /// {@macro Books}
  const Books({required super.supabaseClient})
      : super(BooksRecord._, tableName: 'books', primaryKey: 'id');

  /// The unique identifier of the book.
  @SupaColumnHere<BigInt>(hasDefault: true)
  static final id = BooksColumn<BigInt>._(
    name: 'id',
    valueFromJSON: (v) => BigInt.from(v as int),
    valueToJSON: (v) => v.toString(),
  );

  /// The title of the book.
  @SupaColumnHere<String>()
  static const title = BooksColumn<String>._(name: 'title');

  /// The author of the book.
  @SupaColumnHere<String>()
  static const author = BooksColumn<String>._(name: 'author');

  /// The number of pages in the book.
  @SupaColumnHere<int?>()
  static const pages = BooksColumn<int?>._(name: 'pages');
}
