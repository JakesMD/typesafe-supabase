import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaLessOrEqualFilter}
///
/// ### Column is less than or equal to a value
///
/// A filter that only matches rows where the column is less than or equal to
/// [value].
///
/// `value`: The value to filter with.
///
/// {@endtemplate}
class SupaLessOrEqualFilter<B extends SupaCore> extends SupaFilter<B> {
  /// {@macro SupaLessOrEqualFilter}
  @internal
  const SupaLessOrEqualFilter(this.value, super.previousFilter);

  /// The value to filter with.
  final SupaValue<B, dynamic, Object?> value;

  @override
  PostgrestFilterBuilder<P> build<P>(PostgrestFilterBuilder<P> builder) =>
      builder.lte(value.name, value.toJSONValue()!);
}
