import 'package:api_repository/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuji_film_recipe/app/app.dart';

class App extends StatelessWidget {
  const App({required this.apiRepository, super.key});

  final ApiRepository apiRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: apiRepository),
      ],
      child: const AppView(),
      // child: MultiBlocProvider(
      //   providers: [
      //   ],
      //   child: const AppView(),
      // ),
    );
  }
}
