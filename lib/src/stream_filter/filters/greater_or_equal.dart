import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@macro SupaGreaterOrEqualFilter}
class SupaGreaterOrEqualStreamFilter<B extends SupaCore>
    extends SupaStreamFilter<B> {
  /// {@macro SupaGreaterOrEqualFilter}
  @internal
  const SupaGreaterOrEqualStreamFilter(this.value);

  /// The value to filter with.
  final SupaValue<B, dynamic, num?> value;

  @override
  SupabaseStreamBuilder build(SupabaseStreamFilterBuilder builder) =>
      builder.gte(value.name, value.toJSONValue()!);
}
