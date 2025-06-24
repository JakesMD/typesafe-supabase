# typesafe-supabase

An extension of [typesafe-postgrest](https://github.com/JakesMD/typesafe-postgrest) for [Supabase](https://supabase.com) databases. It minimizes setup and provides additional Supabase-specific features.

> 🚨 This is **NOT** an official *supabase* package and **NOT** developed by the *Supabase* team!

## ✨ Features
- [x] ⚡️ Typesafe queries
- [x] ⚡️ Custom models
- [x] ⚡️ Minimal boilerplate
- [x] ⚡️ Minimal code generation
- [x] ⚡️ Supabase integration

## 😉 Sneak peek
### Define your tables
``` dart
@PgTableHere()
class AuthorsTable extends SupabaseTable<AuthorsTable> {
  AuthorsTable(super.client) : super(tableName: tableName, primaryKey: [id]);

  static const tableName = PgTableName<AuthorsTable>('authors');

  @PgColumnHasDefault()
  static final id = PgBigIntColumn<AuthorsTable>('id');

  static final name = PgStringColumn<AuthorsTable>('name');

  static final books = PgJoinToMany<AuthorsTable, BooksTable>(
    joinColumn: id,
    joinedTableName: BooksTable.tableName,
  );
}
```

### Define your models
``` dart
@PgModelHere()
class Author extends PgModel<AuthorsTable> {
  Author(super.json) : super(builder: builder);

  static final builder = PgModelBuilder<AuthorsTable, Author>(
    constructor: Author.new,
    columns: [
      AuthorsTable.id,
      AuthorsTable.name,
      AuthorsTable.books(AuthorBook.builder),
    ],
  );
}
```

### Generate a tiny piece of code
``` shell
dart run build_runner build
```

<details>
  
<summary>(Toggle to view the generated code)</summary>

``` dart
extension PgAuthorX on Author {
  BigInt get id => value(AuthorsTable.id);
  String get name => value(AuthorsTable.name);
  List<AuthorBook> get books => value(AuthorsTable.books(AuthorBook.builder));
}
```
``` dart
typedef AuthorsTableInsert = AuthorsTableUpsert;

class AuthorsTableUpsert extends PgUpsert<AuthorsTable> {
  AuthorsTableUpsert({required String name, BigInt? id})
    : super([AuthorsTable.name(name), if (id != null) AuthorsTable.id(id)]);
}
```

</details>

### Use it!
``` dart
final authorsTable = AuthorsTable(supabaseClient);

final author = await authorsTable.fetchModel(
  modelBuilder: Author.builder,
  filter: AuthorsTable.name.equals('Michael Bond'),
);

print(author.books);
```

--- 
## 📝 Documentation

All the docs are over at [typesafe-postgrest](https://github.com/JakesMD/typesafe-postgrest).