import 'package:flutter/material.dart';
import 'package:notapp/Pages/login_page.dart';
import 'package:notapp/Pages/register_page.dart';

class login_or_register extends StatefulWidget {
  const login_or_register({super.key});

  @override
  State<login_or_register> createState() => _login_or_registerState();
}

class _login_or_registerState extends State<login_or_register> {

  bool showLoginpage=true;
void togglePages(){
  setState(() {
    showLoginpage=!showLoginpage;
  });
}
  @override
  Widget build(BuildContext context) {
   if(showLoginpage){
    return login_page(onTap: togglePages,);
   }else{
    return register_page(onTap: togglePages,);
   }
  }
}