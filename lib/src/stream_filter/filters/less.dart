import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@macro SupaLessFilter}
class SupaLessStreamFilter<B extends SupaCore> extends SupaStreamFilter<B> {
  /// {@macro SupaLessFilter}
  @internal
  const SupaLessStreamFilter(this.value);

  /// The value to filter with.
  final SupaValue<B, dynamic, num?> value;

  @override
  SupabaseStreamBuilder build(SupabaseStreamFilterBuilder builder) =>
      builder.lt(value.name, value.toJSONValue()!);
}
