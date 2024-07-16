import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

@internal
extension SupaFilterBuilder<T> on PostgrestFilterBuilder<T> {
  PostgrestFilterBuilder<T> supaApply<B extends SupaCore>(
    SupaFilter<B> filter,
  ) {
    final filters = <SupaFilter>[];
    SupaFilter? current = filter;

    while (current != null) {
      filters.insert(0, current);
      current = current.previousFilter;
    }

    return filters.fold(this, (prev, filter) => filter.build(prev));
  }
}
