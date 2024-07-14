import 'package:typesafe_supabase/typesafe_supabase.dart';

part 'books.g.dart';

class Books extends SupaTable<BooksColumn<dynamic>, BooksColumnValue<dynamic>> {
  const Books({required super.supabaseClient})
      : super(tableName: 'books', primaryKey: 'id');

  static final id = BooksColumn<BigInt>._(
    name: 'id',
    hasDefault: true,
    valueFromJSON: (v) => BigInt.from(v as int),
    valueToJSON: (v) => v.toString(),
  );

  static const title = BooksColumn<String>._(name: 'title');

  static const author = BooksColumn<String>._(name: 'author');

  static const pages = BooksColumn<int>._(name: 'pages');
}
