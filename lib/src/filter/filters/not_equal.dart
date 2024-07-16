import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaNotEqualFilter}
///
/// ### Column is not equal to a value
///
/// A filter that only matches rows where the column is not equal to [value].
///
/// `value`: The value to filter with.
///
/// {@endtemplate}
class SupaNotEqualFilter<B extends SupaCore> extends SupaFilter<B> {
  /// {@macro SupaNotEqualFilter}
  @internal
  const SupaNotEqualFilter(this.value, super.previousFilter);

  /// The value to filter with.
  final SupaValue<B, dynamic, dynamic> value;

  @override
  PostgrestFilterBuilder<P> build<P>(PostgrestFilterBuilder<P> builder) =>
      builder.neq(value.name, value.toJSONValue() as Object);
}
