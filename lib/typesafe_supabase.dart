/// The Supabase client library extracted in order to enable mocking and
/// testing in other packages.
library csupabase_client;

export 'src/filter/filter.dart' hide SupaFilterBuilder;
export 'src/generator/annotations.dart';
export 'src/table/table.dart';