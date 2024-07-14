# Type-Safe Supabase for Dart
A dart package that enables type-safe queries to a Supabase database.

# 🚧 WIP 🚧

First, create a table that replicates the one in your Supabase project:
``` dart
import 'package:typesafe_supabase/typesafe_supabase.dart';

part 'books.g.dart';

class Books extends SupaTable<BooksColumn<dynamic>, BooksColumnValue<dynamic>> {
  const Books({required super.supabaseClient})
      : super(tableName: 'books', primaryKey: 'id');

  static final id = BooksColumn<BigInt>._(
    name: 'id',
    hasDefault: true,
    valueFromJSON: (v) => BigInt.parse(v as String),
    valueToJSON: (v) => v.toString(),
  );

  static const title = BooksColumn<String>._(name: 'title');

  static const author = BooksColumn<String>._(name: 'author');

  static const pages = BooksColumn<int>._(name: 'pages');
}
```

Next, run the generator which will generate about 60 lines of code:
```
dart run build_runner build
```

Now use it!
``` dart
// Create the books table.
final books = Books(supabaseClient: supabaseClient);

// Fetch all Paddington books.
final records = await books.fetch(
  columns: {
    Books.id,
    Books.title,
  },
  filter: books.contains(Books.title('Paddington')),
);

// The first book.
final paddingtonBook = records.first;

// The title of the first book.
final title = paddingtonBook(Books.title);

// Insert a new Paddington book.
await books.insert(
  records: [
    BooksInsert(
      title: 'All About Paddington',
      author: 'Bond',
      pages: 160,
    ),
  ],
);

// Delete all Paddington books that were not written by Michael Bond.
await books.delete(
  filter: books
    .contains(Books.title('Paddington'))
    .notEquals(Books.author('Michael Bond')),
);

// Update the title and author of the book with the ID 4.
await books.update(
  values: {
    Books.title('Paddington Here and Now'),
    Books.author('Michael Bond'),
  },
  filter: books.equals(Books.id(BigInt.from(4))),
);
```