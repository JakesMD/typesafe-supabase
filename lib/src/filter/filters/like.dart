// ignore_for_file: avoid_positional_boolean_parameters

import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaLikeFilter}
///
/// ### Column matches a pattern
///
/// A filter that only matches rows where the [column] matches the [pattern].
///
/// `column`: The column to filter with.
///
/// `pattern`: The pattern to match with.
///
/// `isCaseSensitive`: Whether the pattern matching should be case-sensitive.
///
/// {@endtemplate}
class SupaLikeFilter<B extends SupaCore> extends SupaFilter<B> {
  /// {@macro SupaLikeFilter}
  @internal
  const SupaLikeFilter(
    this.column,
    this.pattern,
    this.isCaseSensitive,
    super.previousFilter,
  );

  /// The column to filter with.
  final SupaColumn<B, dynamic, String?> column;

  /// The pattern to match with.
  final String pattern;

  /// Whether the pattern matching should be case-sensitive.
  final bool isCaseSensitive;

  @override
  PostgrestFilterBuilder<P> build<P>(PostgrestFilterBuilder<P> builder) =>
      isCaseSensitive
          ? builder.like(column.name, pattern)
          : builder.ilike(column.name, pattern);
}
