import 'package:env/env.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// {@template supabase_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
///

/// on provided [Env]
typedef EnvValue = String Function(Env env);

class SupabaseRepository {
  /// {@macro supabase_repository}
  SupabaseRepository({required this.env});

  final EnvValue env;
  bool _isInitialized = false;

  late final supabase = Supabase.instance.client;

  Future<void> initialize({bool offlineMode = false}) async {
    if (!_isInitialized) {
      _loadSupabase();
      _isInitialized = true;
    }
  }

  bool isLoggedIn() {
    return supabase.auth.currentSession?.accessToken != null;
  }

  Future<void> _loadSupabase() async {
    await Supabase.initialize(
      url: env(Env.supabaseUrl),
      anonKey: env(Env.supabaseAnonKey),
      authOptions: const FlutterAuthClientOptions(
        authFlowType: AuthFlowType.implicit,
      ),
    );
  }
}
