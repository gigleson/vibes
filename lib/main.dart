// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:vibes/views/home.dart';
// import 'package:vibes/views/splashscreen.dart';

// import 'firebase_options.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp (
//       debugShowCheckedModeBanner: false,

//       // home: const Home(),
//       title: 'Vibes',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
//         useMaterial3: true,
//       ),
//       initialRoute: "welcome_screen",
//       routes: {
//         "/splash":(BuildContext context) =>SplaceScreen(),
//         "/home":(BuildContext context) =>Home(),

//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:vibes/repo/auth_service.dart';
import 'package:vibes/views/login.dart';
import 'package:vibes/views/signin.dart';
import 'views/home.dart';
import 'views/splashscreen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthService>(
          create: (context) => AuthService(),
        ),
       
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Vibes',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        initialRoute: "/login",
        routes: {
          "/splash": (BuildContext context) => SplaceScreen(),
          "/home": (BuildContext context) => Home(),
          "/login": (BuildContext context) => LoginPage(),
          "/signup": (BuildContext context) => SignupPage(),
        },
      ),
    );
  }
}
