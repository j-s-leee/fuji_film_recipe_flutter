import 'package:env/env.dart';
import 'package:flutter/material.dart';
import 'package:fuji_film_recipe/app/di/di.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared/shared.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GoogleSignInButton(),
              SizedBox(
                height: 12,
              ),
              LogOutButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  Future<void> _googleSignIn() async {
    final webClientId = getIt<AppFlavor>().getEnv(Env.webClientId);
    final iOSClientId = getIt<AppFlavor>().getEnv(Env.iOSClientId);

    final googleSignIn =
        GoogleSignIn(clientId: iOSClientId, serverClientId: webClientId);

    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;
    if (googleAuth == null) {
      throw Exception('Google sign in was cenceled');
    }
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;
    if (accessToken == null) {
      throw Exception('No access token found');
    }
    if (idToken == null) {
      throw Exception('No ID Token found');
    }
    await Supabase.instance.client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        try {
          await _googleSignIn();
        } catch (error, stackTrace) {
          Error.throwWithStackTrace(
            'Failed to login with google.',
            stackTrace,
          );
        }
      },
      icon: const Icon(Icons.auto_awesome),
      label: const Text('Google Sign in'),
    );
  }
}

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  void _logOut() => Supabase.instance.client.auth.signOut();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final session = snapshot.data!.session;
          if (session == null) return SizedBox.shrink();
          return ElevatedButton.icon(
            onPressed: _logOut,
            icon: const Icon(Icons.logout),
            label: const Text('LogOut'),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
