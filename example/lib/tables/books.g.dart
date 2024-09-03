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
base class BooksCore extends SupaCore {}

/// {@template BooksRecord}
///
/// Represents a record fetched from [Books].
///
/// {@endtemplate}
class BooksRecord extends SupaRecord<BooksCore> {
  /// {@macro BooksRecord}
  const BooksRecord(super.json);

  /// The unique identifier of the book.
  ///
  /// This will throw an exception if the column was not fetched.
  BigInt get id => call(Books.id);

  /// The title of the book.
  ///
  /// This will throw an exception if the column was not fetched.
  String get title => call(Books.title);

  /// The unique identifier of the author of the book.
  ///
  /// This will throw an exception if the column was not fetched.
  BigInt get authorID => call(Books.authorID);

  /// The number of pages in the book.
  ///
  /// This will throw an exception if the column was not fetched.
  int? get pages => call(Books.pages);

  /// References the `authors` table joined by the `author_id` column.
  ///
  /// This will throw an exception if no joined columns were fetched.
  ///
  /// An InvalidType error here is often caused by a misspelling of the prefix in the @SupaTableJoinHere annotation.
  AuthorsRecord get author => referenceSingle(Books.author)!;
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
    required this.authorID,
    this.pages,
  });

  /// The unique identifier of the book.
  final BigInt? id;

  /// The title of the book.
  final String title;

  /// The unique identifier of the author of the book.
  final BigInt authorID;

  /// The number of pages in the book.
  final int? pages;

  @override
  Set<SupaValue<BooksCore, dynamic, dynamic>> get values => {
        if (id != null) Books.id(id!),
        Books.title(title),
        Books.authorID(authorID),
        if (pages != null) Books.pages(pages),
      };
}
