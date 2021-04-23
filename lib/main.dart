import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:Musama/Pages/Welcome%20Pages/introPage.dart';
import 'package:Musama/services/Authenticatiion_Services.dart';
import 'package:provider/provider.dart' as p;

import 'Pages/Home/HomePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return p.MultiProvider(
        providers: [
          p.Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          p.StreamProvider(
              create: (context) =>
                  context.read<AuthenticationService>().authStateChanges),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Musama',
          theme: ThemeData(
            primarySwatch: Colors.teal,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: AuthenticationWrapper(),
        ));
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      return HomePage();
    }
    return HomePage();
  }
}
