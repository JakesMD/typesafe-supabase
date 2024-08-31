import 'package:typesafe_supabase/typesafe_supabase.dart';
import 'package:typesafe_supabase_example/tables/authors.dart';

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
      : super(BooksRecord.new, tableName: 'books', primaryKey: const ['id']);

  /// The unique identifier of the book.
  @SupaColumnHere<BigInt>(hasDefault: true)
  static const id = SupaColumn<BooksCore, BigInt, int>(name: 'id');

  /// The title of the book.
  @SupaColumnHere<String>()
  static const title = SupaColumn<BooksCore, String, String>(name: 'title');

  /// The unique identifier of the author of the book.
  @SupaColumnHere<BigInt>()
  static const authorID = SupaColumn<BooksCore, BigInt, int>(name: 'author_id');

  /// The number of pages in the book.
  @SupaColumnHere<int?>()
  static const pages = SupaColumn<BooksCore, int?, int?>(name: 'pages');

  /// References the `authors` table joined by the `author_id` column.
  @SupaTableJoinHere(
    'Authors',
    'authors',
    SupaJoinType.oneToOne,
    isNullable: false,
  )
  static final author = SupaTableJoin<BooksCore, AuthorsCore>(
    tableName: 'authors',
    joiningColumn: Books.authorID,
    joinType: SupaJoinType.oneToOne,
    record: AuthorsRecord.new,
  );
}
