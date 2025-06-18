# Type-safe supabase for dart
> 🚨 This is **NOT** an official *supabase* package and **NOT** developed by the *supabase* team!
- [x] ⚡️ Type-safe queries
- [x] ⚡️ Foolproof filters
- [x] ⚡️ Foolproof modifiers
- [x] ⚡️ Minimal setup
- [x] ⚡️ Minimal code generation


## A Quick Update & Future Vision

I've been working on a new and improved version of this package: [`typesafe_postgrest`](https://github.com/JakesMD/typesafe-postgrest):
- [x] Better API
- [x] Almost zero boilerplate
- [x] Even less code generation (you can do it by hand if you want)
- [x] Custom models (instead of just `SupaRecord`)
- [x] Generic for any Postgres database, not just Supabase

This package will become an extension of `typesafe_postgrest` that handles the Supabase specifics for you.

You'll find the new `typesafe_supabase` package in the `beta` branch.


## 🎮 Basic Usage

> 🚧 **WIP!** This package is still under development. Use it with caution and [file any potential issues you see](https://github.com/JakesMD/typesafe-supabase/issues).

First, create your tables that replicate the ones in your Supabase project:
``` dart
// authors.dart

import 'package:typesafe_supabase/typesafe_supabase.dart';

part 'authors.g.dart';

/// Represents the `authors` table in the Supabase database.
@SupaTableHere()
class Authors extends SupaTable<AuthorsCore, AuthorsRecord> {
  const Authors({required super.supabaseClient})
      : super(AuthorsRecord.new, tableName: 'authors', primaryKey: const ['id']);

  /// The unique identifier of the author.
  @SupaColumnHere<BigInt>(hasDefault: true)
  static const id = SupaColumn<AuthorsCore, BigInt, int>(name: 'id');

  /// The author's name.
  @SupaColumnHere<String>()
  static const name = SupaColumn<AuthorsCore, String, String>(name: 'name');
}
```
``` dart
// books.dart

import 'package:typesafe_supabase/typesafe_supabase.dart';

part 'books.g.dart';

/// Represents the `books` table in the Supabase database.
@SupaTableHere()
class Books extends SupaTable<BooksCore, BooksRecord> {
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
  @SupaTableJoinHere('Authors', 'authors', SupaJoinType.oneToOne, isNullable: false)
  static final author = SupaTableJoin<BooksCore, AuthorsCore>(
    tableName: 'authors',
    joiningColumn: Books.authorID,
    joinType: SupaJoinType.oneToOne,
    record: AuthorsRecord.new,
  );
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

// Fetch a Paddington book.
final book = await books.fetch(
  columns: {
    Books.title,
    Books.author({Authors.name}),
  },
  filter: books.textSearch(Books.title('Paddington')),
  modifier: books.order(Books.title).limit(1).single(),
);

// Print the title of the book.
print(book.title);

// Print the author's name.
print(book.author.name);

// Insert a new Paddington book.
await books.insert(
  records: [
    BooksInsert(title: 'To be updated', authorID: BigInt.two, pages: 160),
  ],
  modifier: books.none(),
);

// Update the title and author of the book with the ID 4.
await books.update(
  values: {
    Books.title('Paddington Here and Now'),
    Books.authorID(BigInt.one),
  },
  filter: books.equal(Books.id(BigInt.from(4))),
  modifier: books.none(),
);

// Delete all Paddington books that were not written by Michael Bond.
await books.delete(
  filter: books
      .textSearch(Books.title('Paddington'))
      .notEqual(Books.authorID(BigInt.one)),
  modifier: books.none(),
);
```

## 📋 TODO
- [ ] Query JSON data (`.select('address->city')`)
- [ ] Filter by JSON key (`.eq('address->postcode', 90210)`)
- [ ] In-depth documentation