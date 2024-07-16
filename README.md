# Type-Safe Supabase for Dart
A dart package that enables type-safe queries to a Supabase database.

# 🚧 WIP 🚧

## Basic Usage
First, create a table that replicates the one in your Supabase project:
``` dart
import 'package:typesafe_supabase/typesafe_supabase.dart';

part 'books.g.dart';

@SupaTableHere()
class Books extends SupaTable<BooksCore, BooksRecord> {
  /// {@macro Books}
  const Books({required super.supabaseClient})
      : super(BooksRecord._, tableName: 'books', primaryKey: 'id');

  @SupaColumnHere<BigInt>(hasDefault: true)
  static final id = SupaColumn<BooksCore, BigInt, int>(
    name: 'id',
    valueFromJSON: BigInt.from,
    valueToJSON: (v) => v.toInt(),
  );

  @SupaColumnHere<String>()
  static const title = SupaColumn<BooksCore, String, String>(name: 'title');

  @SupaColumnHere<String>()
  static const author = SupaColumn<BooksCore, String, String>(name: 'author');

  @SupaColumnHere<int?>()
  static const pages = SupaColumn<BooksCore, int?, int?>(name: 'pages');
}
```

Next, run the generator to generate a small piece of code:
```
dart run build_runner build
```

Now use it!
``` dart
// Create the books table.
final books = Books(supabaseClient: supabaseClient);

// Fetch all Paddington books.
final records = await books.fetch(
  columns: {Books.id, Books.title},
  filter: books.textSearch(Books.title('Paddington')),
);

// The title of the first book.
final title = records.first.title;

// Insert a new Paddington book.
await books.insert(
  records: [
    const BooksInsert(
      title: 'All About Paddington',
      author: 'Bond',
      pages: 160,
    ),
  ],
);

// Update the title and author of the book with the ID 4.
await books.update(
  values: {
    Books.title('Paddington Here and Now'),
    Books.author('Michael Bond'),
  },
  filter: books.equals(Books.id(BigInt.from(4))),
);

// Delete all Paddington books that were not written by Michael Bond.
await books.delete(
  filter: books
      .textSearch(Books.title('Paddington'))
      .notEquals(Books.author('Michael Bond')),
);
```

## Advanced Usage
### `@SupaTableHere()` Annotation
By default, all the generated classes will be prefixed with the name of your table class.

You can set your own prefix with:
``` dart
@SupaTableHere('MyCustomPrefix')
```

Now all generated classes will look like `MyCustomPrefixColumn`, `MyCustomPrefixRecord`, ...

### `@SupaColumnHere<T>()` Annotation
#### `hasDefault`
If your column has a default value that is generated inside the database, use:
```
@SupaColumnHere<MyType>(hasDefault: true)
```

Now `BooksInsert`, for example, will accept the column as an optional value. This is generally useful for columns like `id`, `created_at`, `created_by`, ...

If your column is nullable, then setting `hasDefault` is not required.

#### Documentation comments
If you document your columns, the documentation comment will be applied to `BooksInsert.title` and `BooksRecord.title`, for example.


## Known limitations
- Currently unable to filter within JSON columns. For now use the `.filter()` custom filter.
