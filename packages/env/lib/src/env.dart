/// {@template env}
/// A repository that manages environmental variables.
/// {@endtemplate}
enum Env {
  supabaseUrl('SUPABASE_URL'),
  iOSClientId('IOS_CLIENT_ID'),
  webClientId('WEB_CLIENT_ID'),
  supabaseAnonKey('SUPABASE_ANON_KEY');
  /// {@macro env}
  const Env(this.value);

  final String value;
}
