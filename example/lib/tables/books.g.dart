// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books.dart';

// **************************************************************************
// SupaTableGenerator
// **************************************************************************

// ignore_for_file: strict_raw_type
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

/// The base class that links all classes for [Books] together
/// to create full type safety.
final class BooksCore extends SupaCore {}

/// Represents a record fetched from [Books].
class BooksRecord extends SupaRecord<BooksCore> {
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
class BooksInsert extends SupaInsert<BooksCore> {
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
  Set<SupaValue<BooksCore, dynamic, dynamic>> get values => {
        if (id != null) Books.id(id!),
        Books.title(title),
        Books.author(author),
        if (pages != null) Books.pages(pages),
      };
}
