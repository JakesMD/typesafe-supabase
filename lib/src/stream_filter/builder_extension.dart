import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

@internal
extension SupaStreamFilterBuilder<T> on SupabaseStreamFilterBuilder {
  SupabaseStreamBuilder supaApplyFilter<B extends SupaCore>(
    SupaStreamFilter<B> filter,
  ) =>
      filter.build(this);
}
