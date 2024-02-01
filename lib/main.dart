import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vibes/views/login.dart';

import 'package:vibes/views/home.dart';
import 'package:vibes/views/signin.dart';
import 'package:vibes/views/splashscreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vibes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      initialRoute: "/splash",
     routes: {
          "/splash": (BuildContext context) => SplaceScreen(),
          "/home": (BuildContext context) => Home(),
          "/login": (BuildContext context) => LoginPage(),
          "/signup": (BuildContext context) => SignupPage(),
        },
    );
  }
}
