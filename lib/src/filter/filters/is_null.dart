import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaIsNullFilter}
///
/// ### Column is equal to null
///
/// A filter that only matches rows where the [column] is equal to null.
///
/// `column`: The column to filter on.
///
/// {@endtemplate}
class SupaIsNullFilter<B extends SupaCore> extends SupaFilter<B> {
  /// {@macro SupaIsNullFilter}
  @internal
  const SupaIsNullFilter(this.column, super.previousFilter);

  /// The column to filter on.
  final SupaColumn<B, dynamic, Object?> column;

  @override
  PostgrestFilterBuilder<P> build<P>(PostgrestFilterBuilder<P> builder) =>
      builder.isFilter(column.name, null);
}
