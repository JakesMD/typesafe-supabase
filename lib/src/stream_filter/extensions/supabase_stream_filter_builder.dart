import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

@internal
extension SupaSupabaseStreamFilterBuilderX on SupabaseStreamFilterBuilder {
  SupabaseStreamBuilder applySupaFilter<TableType>(
          SupaStreamFilter<TableType> filter) =>
      filter.build(this);
}
