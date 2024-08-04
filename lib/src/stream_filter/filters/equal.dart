import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@macro SupaEqualFilter}
class SupaEqualStreamFilter<B extends SupaCore> extends SupaStreamFilter<B> {
  /// {@macro SupaEqualFilter}
  @internal
  const SupaEqualStreamFilter(this.value);

  /// The value to filter with.
  final SupaValue<B, dynamic, dynamic> value;

  @override
  SupabaseStreamBuilder build(SupabaseStreamFilterBuilder builder) =>
      builder.eq(value.name, value.toJSONValue() as Object);
}
