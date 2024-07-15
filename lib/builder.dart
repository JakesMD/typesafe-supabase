import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:typesafe_supabase/src/generator/supa_table_generator.dart';
import 'package:typesafe_supabase/typesafe_supabase.dart';

/// The builder that generates all the necessary classes for a [SupaTable].
Builder supaTableBuilder(BuilderOptions options) => SharedPartBuilder(
      [SupaTableGenerator()],
      'supa_table',
    );
