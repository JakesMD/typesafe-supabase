import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaEqualFilter}
///
/// ### Column is equal to a value
///
/// A filter that only matches rows where the column is equal to [value].
///
/// `value`: The value to filter with.
///
/// {@endtemplate}
class SupaEqualFilter<B extends SupaCore> extends SupaFilter<B> {
  /// {@macro SupaEqualFilter}
  @internal
  const SupaEqualFilter(this.value, super.previousFilter);

  /// The value to filter with.
  final SupaValue<B, dynamic, dynamic> value;

  @override
  PostgrestFilterBuilder<P> build<P>(PostgrestFilterBuilder<P> builder) =>
      builder.eq(value.name, value.toJSONValue() as Object);
}
