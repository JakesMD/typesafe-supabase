part of 'books.dart';

class BooksColumn<T> extends SupaColumn<T, BooksColumnValue<T>> {
  const BooksColumn._({
    required super.name,
    super.hasDefault,
    super.valueToJSON,
    super.valueFromJSON,
  });

  BooksColumnValue<T> call(T value) => BooksColumnValue._(
        value: value,
        name: name,
        valueFromJSON: valueFromJSON,
        valueToJSON: valueToJSON,
      );
}

class BooksColumnValue<T> extends SupaValue<T> {
  const BooksColumnValue._({
    required super.value,
    required super.name,
    required super.valueFromJSON,
    required super.valueToJSON,
  });
}

class BooksRecord extends SupaRecord<BooksColumn, BooksColumnValue> {
  const BooksRecord._(super.json);
}

class BooksInsert extends SupaInsert<Books, BooksColumn, BooksColumnValue> {
  const BooksInsert({
    required this.id,
    required this.title,
    required this.author,
    required this.pages,
  });

  final BigInt? id;
  final String title;
  final String author;
  final int pages;

  @override
  Set<BooksColumnValue> values(Books table) => {
        if (id != null) Books.id(id!),
        Books.title(title),
        Books.author(author),
        Books.pages(pages),
      };
}
