import 'package:env/env.dart';
import 'package:flutter/material.dart';
import 'package:fuji_film_recipe/app/di/di.dart';
import 'package:fuji_film_recipe/l10n/l10n.dart';
import 'package:shared/shared.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: SafeArea(child: Scaffold(body: Text('initial commit'),
      ),
      ),
    );
  }
}
