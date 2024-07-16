import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaMatchFilter}
///
/// ### Match an associated value
///
/// A filter that finds all rows whose columns match the specified [values].
///
/// `values`: The values to filter with.
///
/// {@endtemplate}
class SupaMatchFilter<B extends SupaCore> extends SupaFilter<B> {
  /// {@macro SupaMatchFilter}
  @internal
  const SupaMatchFilter(this.values, super.previousFilter);

  /// The values to filter with.
  final Set<SupaValue<B, dynamic, dynamic>> values;

  @override
  PostgrestFilterBuilder<T> build<T>(PostgrestFilterBuilder<T> builder) {
    final matcher = values.fold<Map<String, Object>>(
      {},
      (prev, column) => {...prev, column.name: column.toJSONValue() as Object},
    );

    return builder.match(matcher);
  }
}
