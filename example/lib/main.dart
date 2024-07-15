// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase_example/secrets.dart';
import 'package:typesafe_supabase_example/tables/books.dart';

void main() async {
  final supabaseClient = SupabaseClient(
    SUPABASE_PROJECT_URL,
    SUPABASE_ANON_KEY,
  );

  // Create the books table.
  final books = Books(supabaseClient: supabaseClient);

  // Fetch all Paddington books.
  final records = await books.fetch(
    columns: {Books.id, Books.title},
    filter: books.textSearch(Books.title('Paddington')),
  );
  print(records.length);

  // The first book.
  final paddingtonBook = records.first;

  // The title of the first book.
  final title = paddingtonBook(Books.title);
  print(title);

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

  exit(0);
}
