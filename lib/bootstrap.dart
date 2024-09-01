import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:fuji_film_recipe/app/app.dart';
import 'package:shared/shared.dart';
import 'package:supabase_repository/supabase_repository.dart';

typedef AppBuilder = FutureOr<Widget> Function(SupabaseRepository);

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(
  AppBuilder builder, {
  required FirebaseOptions options,
  required AppFlavor appFlavor,
}) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  // init repository
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    setupDi(appFlavor: appFlavor);

    await Firebase.initializeApp(name: 'Fuji-Film-Recipe', options: options);

    final supabaseRepository = SupabaseRepository(env: appFlavor.getEnv);
    await supabaseRepository.initialize();

    runApp(await builder(supabaseRepository));
  }, (error, stack) {
    log(error.toString(), stackTrace: stack);
  });
}
