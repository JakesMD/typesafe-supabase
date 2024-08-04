import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

export 'builder_extension.dart';
export 'filters/_filters.dart';
export 'mixin.dart';

/// {@template SupaStreamFilter}
///
/// Represents a filter that can be applied to a Supabase stream query.
///
/// Filters allow you to only return rows that match certain conditions.
///
/// Only one filter can be applied to a stream query.
///
/// {@endtemplate}
class SupaStreamFilter<B extends SupaCore> {
  /// {@macro SupaStreamFilter}
  @internal
  const SupaStreamFilter();

  /// Applies the Supabase stream filter onto the provided [builder].
  @mustBeOverridden
  @internal
  SupabaseStreamBuilder build(SupabaseStreamFilterBuilder builder) => builder;
}
