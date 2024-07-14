import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

export 'builder_extension.dart';

part 'filters/contains.dart';
part 'filters/equals.dart';
part 'filters/match.dart';
part 'filters/not_equals.dart';
part 'mixin.dart';

/// {@template SupaFilter}
///
/// Represents a filter that can be applied to a Supabase query.
///
/// {@endtemplate}
class SupaFilter<V extends SupaValue<dynamic>> with SupaFilterMixin<V> {
  /// {@macro SupaFilter}
  const SupaFilter(this.previousFilter);

  @override
  final SupaFilter<V>? previousFilter;

  /// Cascades the Supabase filter onto the provided [builder].
  @mustBeOverridden
  @internal
  PostgrestFilterBuilder<T> build<T>(PostgrestFilterBuilder<T> builder) =>
      builder;
}
