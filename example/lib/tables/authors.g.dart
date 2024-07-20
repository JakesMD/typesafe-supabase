// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authors.dart';

// **************************************************************************
// SupaTableGenerator
// **************************************************************************

// ignore_for_file: strict_raw_type
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

/// The base class that links all classes for [Authors] together
/// to create full type safety.
base class AuthorsCore extends SupaCore {}

/// {@template AuthorsRecord}
///
/// Represents a record fetched from [Authors].
///
/// {@endtemplate}
class AuthorsRecord extends SupaRecord<AuthorsCore> {
  /// {@macro AuthorsRecord}
  const AuthorsRecord(super.json);

  /// The unique identifier of the author.
  ///
  /// This will throw an exception if the column was not fetched.
  BigInt get id => call(Authors.id);

  /// The author's name.
  ///
  /// This will throw an exception if the column was not fetched.
  String get name => call(Authors.name);
}

/// {@template AuthorsInsert}
///
/// Represents an insert operation on [Authors].
///
/// {@endtemplate}
class AuthorsInsert extends SupaInsert<AuthorsCore> {
  /// {@macro AuthorsInsert}
  const AuthorsInsert({
    this.id,
    required this.name,
  });

  /// The unique identifier of the author.
  final BigInt? id;

  /// The author's name.
  final String name;

  @override
  Set<SupaValue<AuthorsCore, dynamic, dynamic>> get values => {
        if (id != null) Authors.id(id!),
        Authors.name(name),
      };
}
