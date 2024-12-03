import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notapp/Pages/home_page.dart';
import 'package:notapp/auth/login_or_Register.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context,snapshot){
      if(snapshot.hasData){
        return const home_page();
      }else{
        return const login_or_register();
      }
    });
  }
}