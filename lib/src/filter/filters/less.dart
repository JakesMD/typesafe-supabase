import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaLessFilter}
///
/// ### Column is less than a value
///
/// A filter that only matches rows where the column is less than [value].
///
/// `value`: The value to filter with.
///
/// {@endtemplate}
class SupaLessFilter<B extends SupaCore> extends SupaFilter<B> {
  /// {@macro SupaLessFilter}
  @internal
  const SupaLessFilter(this.value, super.previousFilter);

  /// The value to filter with.
  final SupaValue<B, dynamic, Object?> value;

  @override
  PostgrestFilterBuilder<P> build<P>(PostgrestFilterBuilder<P> builder) =>
      builder.lt(value.name, value.toJSONValue()!);
}
