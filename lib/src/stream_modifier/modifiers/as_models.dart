import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:typesafe_supabase/src/stream_modifier/stream_modifier.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// {@macro typesafe_postgrest.PgAsModelsModifier}
class SupaAsModelsStreamModifier<TableType,
        ModelType extends PgModel<TableType>>
    extends SupaStreamModifier<TableType, List<ModelType>, PgJsonList> {
  /// {@macro typesafe_postgrest.PgAsModelsModifier}
  @internal
  const SupaAsModelsStreamModifier(super.previousModifier, this.fromJson);

  /// The function used to convert the JSON to the model.
  final ModelType Function(Map<String, dynamic>) fromJson;

  @override
  @internal
  SupaStreamModifierBuilder<List<ModelType>> build(
          SupabaseStreamBuilder builder) =>
      SupaStreamModifierBuilder(builder);
}
