/// The Supabase client library extracted in order to enable mocking and
/// testing in other packages.
library csupabase_client;

export 'src/core/core.dart';
export 'src/filter/filter.dart' hide SupaFilterBuilder;
export 'src/generator/annotations.dart';
export 'src/modifier/modifier.dart' hide SupaModifierBuilder;
export 'src/stream_filter/filter.dart' hide SupaStreamFilterBuilder;
export 'src/stream_modifier/modifier.dart' hide SupaStreamModifierBuilder;
