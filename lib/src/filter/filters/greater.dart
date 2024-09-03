import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@template SupaGreaterFilter}
///
/// ### Column is greater than a value
///
/// A filter that only matches rows where the column is greater than [value].
///
/// `value`: The value to filter with.
///
/// {@endtemplate}
class SupaGreaterFilter<B extends SupaCore> extends SupaFilter<B> {
  /// {@macro SupaGreaterFilter}
  @internal
  const SupaGreaterFilter(this.value, super.previousFilter);

  /// The value to filter with.
  final SupaValue<B, dynamic, Object?> value;

  @override
  PostgrestFilterBuilder<P> build<P>(PostgrestFilterBuilder<P> builder) =>
      builder.gt(value.name, value.toJSONValue()!);
}
