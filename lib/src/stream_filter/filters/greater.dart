import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@macro SupaGreaterFilter}
class SupaGreaterStreamFilter<B extends SupaCore> extends SupaStreamFilter<B> {
  /// {@macro SupaGreaterFilter}
  @internal
  const SupaGreaterStreamFilter(this.value);

  /// The value to filter with.
  final SupaValue<B, dynamic, num?> value;

  @override
  SupabaseStreamBuilder build(SupabaseStreamFilterBuilder builder) =>
      builder.gt(value.name, value.toJSONValue()!);
}
