// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books.dart';

// **************************************************************************
// SupaTableGenerator
// **************************************************************************

// ignore_for_file: strict_raw_type
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

/// Represents a column in [Books].
///
/// This is merely a wrapper around [SupaColumn] to make the table foolproof.
class BooksColumn<T> extends SupaColumn<T, BooksColumnValue<T>> {
  const BooksColumn._({
    required super.name,
    super.valueToJSON,
    super.valueFromJSON,
  });

  @override
  BooksColumnValue<T> call(T value) => BooksColumnValue._(
        value: value,
        name: name,
        valueFromJSON: valueFromJSON,
        valueToJSON: valueToJSON,
      );
}

/// Represents a value that is stored within a record from [Books].
///
/// This is merely a wrapper around [SupaValue] to make the table foolproof.
class BooksColumnValue<T> extends SupaValue<T> {
  const BooksColumnValue._({
    required super.value,
    required super.name,
    required super.valueFromJSON,
    required super.valueToJSON,
  });
}

/// Represents a record fetched from [Books].
///
/// This is merely a wrapper around [SupaRecord] to make the table foolproof.
class BooksRecord extends SupaRecord<BooksColumn, BooksColumnValue> {
  const BooksRecord._(super.json);

  /// The unique identifier of the book.
  ///
  /// This will throw an exception if the column was not fetched.
  BigInt get id => call(Books.id);

  /// The title of the book.
  ///
  /// This will throw an exception if the column was not fetched.
  String get title => call(Books.title);

  /// The author of the book.
  ///
  /// This will throw an exception if the column was not fetched.
  String get author => call(Books.author);

  /// The number of pages in the book.
  ///
  /// This will throw an exception if the column was not fetched.
  int? get pages => call(Books.pages);
}

/// {@template BooksInsert}
///
/// Represents an insert operation on [Books].
///
/// {@endtemplate}
class BooksInsert extends SupaInsert<BooksColumnValue> {
  /// {@macro BooksInsert}
  const BooksInsert({
    this.id,
    required this.title,
    required this.author,
    this.pages,
  });

  /// The unique identifier of the book.
  final BigInt? id;

  /// The title of the book.
  final String title;

  /// The author of the book.
  final String author;

  /// The number of pages in the book.
  final int? pages;

  @override
  Set<BooksColumnValue> get values => {
        if (id != null) Books.id(id!),
        Books.title(title),
        Books.author(author),
        if (pages != null) Books.pages(pages),
      };
}
