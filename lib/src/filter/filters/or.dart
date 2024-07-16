import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaOrFilter}
///
/// ### Match at least one filter
///
/// A filter that only matches rows satisfying at least one of the filters.
///
/// `filters`: The filters to use, following PostgREST syntax.
///
/// `referencedTable`: Set this to filter on referenced tables instead of the
/// parent table.
///
/// {@endtemplate}
class SupaOrFilter<B extends SupaCore> extends SupaFilter<B> {
  /// {@macro SupaOrFilter}
  @internal
  const SupaOrFilter(this.filters, this.referencedTable, super.previousFilter);

  /// The filters to use, following PostgREST syntax.
  final String filters;

  /// Set this to filter on referenced tables instead of the parent table.
  final String? referencedTable;

  @override
  PostgrestFilterBuilder<P> build<P>(PostgrestFilterBuilder<P> builder) =>
      builder.or(filters, referencedTable: referencedTable);
}
