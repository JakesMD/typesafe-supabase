import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaGreaterOrEqualFilter}
///
/// ### Column is greater than or equal to a value
///
/// A filter that only matches rows where the column is greater than or equal to
/// [value].
///
/// `value`: The value to filter with.
///
/// {@endtemplate}
class SupaGreaterOrEqualFilter<B extends SupaCore> extends SupaFilter<B> {
  /// {@macro SupaGreaterOrEqualFilter}
  @internal
  const SupaGreaterOrEqualFilter(this.value, super.previousFilter);

  /// The value to filter with.
  final SupaValue<B, dynamic, num?> value;

  @override
  PostgrestFilterBuilder<P> build<P>(PostgrestFilterBuilder<P> builder) =>
      builder.gte(value.name, value.toJSONValue()!);
}
