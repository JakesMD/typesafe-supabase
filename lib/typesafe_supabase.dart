import 'package:supabase/supabase.dart';
import 'package:typesafe_postgrest/typesafe_postgrest.dart';

/// {@template SupabaseTable}
///
/// A [PgTable] configured to use a [SupabaseClient] with added support for
/// Supabase's Realtime API.
///
/// `client`: The [SupabaseClient] to use.
///
/// `tableName`: The name of the table in the Supabase database.
///
/// `primaryKey`: The list of columns that combined act as the primary key for
///               the table. This is required Supabase's Realtime API.
///
/// `schema`: The schema in which the table is located in the Supabase database.
///
/// {@endtemplate}
class SupabaseTable<TableType> extends PgTable<TableType> {
  /// {@macro SupabaseTable}
  SupabaseTable({
    required SupabaseClient client,
    required String tableName,
    required this.primaryKey,
    String schema = 'public',
  }) : super(
          tableName: PgTableName<TableType>(tableName),
          initialQuery: (tableName) => client.schema(schema).from(tableName),
        );

  /// The list of columns that combined act as the primary key for the table.
  /// This is required Supabase's Realtime API.
  final PgColumnList<TableType> primaryKey;
}
