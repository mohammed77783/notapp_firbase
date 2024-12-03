import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notapp/Pages/User_page.dart';
import 'package:notapp/Pages/Wall_page.dart';
import 'package:notapp/Pages/home_page.dart';
import 'package:notapp/Pages/login_page.dart';
import 'package:notapp/Pages/profile_page.dart';
import 'package:notapp/Pages/register_page.dart';
import 'package:notapp/Theme/dark_mode.dart';
import 'package:notapp/Theme/light_mode.dart';
import 'package:notapp/auth/auth.dart';
import 'package:notapp/auth/login_or_Register.dart';
import 'package:notapp/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
      theme:lightmode,
      darkTheme: dark_mode,
  routes: {
    '/login_register_page':(context)=>const login_or_register(),
       '/home_page':(context)=>const home_page(),
          '/profile':(context)=> Profile_page(),
             '/user_page':(context)=>const User_page(),
             '/wall':(context)=> Wall_page()
  },
    );

  }
}