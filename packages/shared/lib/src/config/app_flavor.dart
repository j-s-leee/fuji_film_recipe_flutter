// ignore_for_file: public_member_api_docs

import 'package:env/env.dart';

enum Flavor { development, production }

sealed class AppEnv {
  const AppEnv();

  String getEnv(Env env);
}

class AppFlavor extends AppEnv {
  const AppFlavor._({required this.flavor});

  factory AppFlavor.development() => const AppFlavor._(flavor: Flavor.development);
  factory AppFlavor.production() => const AppFlavor._(flavor: Flavor.production);

  final Flavor flavor;

  @override
  String getEnv(env) => switch (env) {
    Env.supabaseUrl => switch (flavor) {
      Flavor.development => EnvDev.supabaseUrl,
      Flavor.production => EnvDev.supabaseUrl,
    },
    Env.supabaseAnonKey => switch (flavor) {
      Flavor.development => EnvDev.supabaseAnonKey,
      Flavor.production => EnvDev.supabaseAnonKey,
    },
    Env.iOSClientId => switch (flavor) {
      Flavor.development => EnvDev.iOSClientId,
      Flavor.production => EnvProd.iOSClientId,
    },
    Env.webClientId => switch (flavor) {
      Flavor.development => EnvDev.webClientId,
      Flavor.production => EnvProd.webClientId,
    }
  };

}