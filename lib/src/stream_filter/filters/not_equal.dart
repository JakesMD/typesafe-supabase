import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@macro SupaNotEqualFilter}
class SupaNotEqualStreamFilter<B extends SupaCore> extends SupaStreamFilter<B> {
  /// {@macro SupaNotEqualFilter}
  @internal
  const SupaNotEqualStreamFilter(this.value);

  /// The value to filter with.
  final SupaValue<B, dynamic, dynamic> value;

  @override
  SupabaseStreamBuilder build(SupabaseStreamFilterBuilder builder) =>
      builder.neq(value.name, value.toJSONValue() as Object);
}
