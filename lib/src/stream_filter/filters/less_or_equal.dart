import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@macro SupaLessOrEqualFilter}
class SupaLessOrEqualStreamFilter<B extends SupaCore>
    extends SupaStreamFilter<B> {
  /// {@macro SupaLessOrEqualFilter}
  @internal
  const SupaLessOrEqualStreamFilter(this.value);

  /// The value to filter with.
  final SupaValue<B, dynamic, num?> value;

  @override
  SupabaseStreamBuilder build(SupabaseStreamFilterBuilder builder) =>
      builder.lte(value.name, value.toJSONValue()!);
}
