import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaTextSearchFilter}
///
/// ### Match a string
///
/// A filter that only matches rows where the column contains [searchText].
///
/// `searchText`: The query text to filter with.
///
/// `config`: The text search configuration to use.
///
/// `type`: Change how the query text is interpreted.
///
/// {@endtemplate}
class SupaTextSearchFilter<B extends SupaCore> extends SupaFilter<B> {
  /// {@macro SupaTextSearchFilter}
  @internal
  const SupaTextSearchFilter(
    this.searchText,
    this.config,
    this.type,
    super.previousFilter,
  );

  /// The query text to filter with.
  final SupaValue<B, dynamic, String?> searchText;

  /// The text search configuration to use.
  final String? config;

  /// Change how the query text is interpreted.
  final TextSearchType? type;

  @override
  PostgrestFilterBuilder<P> build<P>(PostgrestFilterBuilder<P> builder) =>
      builder.textSearch(
        searchText.name,
        searchText.toJSONValue() ?? '',
        config: config,
        type: type,
      );
}
