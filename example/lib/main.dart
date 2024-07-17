import 'dart:io';

import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';
import 'package:typesafe_supabase_example/secrets.dart';
import 'package:typesafe_supabase_example/tables/books.dart';

void main() async {
  final supabaseClient = SupabaseClient(
    SUPABASE_PROJECT_URL,
    SUPABASE_ANON_KEY,
  );

  // Create the books table.
  final books = Books(supabaseClient: supabaseClient);

  // Fetch a Paddington book.
  final book = await books.fetch(
    columns: {Books.id, Books.title},
    filter: books.textSearch(Books.title('Paddington')),
    modifier: books.order(Books.title).limit(1).single(),
  );

  // Print the title of the book.
  print(book.title);

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
    filter: books.equal(Books.id(BigInt.from(4))),
  );

  // Delete all Paddington books that were not written by Michael Bond.
  await books.delete(
    filter: books
        .textSearch(Books.title('Paddington'))
        .notEqual(Books.author('Michael Bond')),
  );

  exit(0);
}
