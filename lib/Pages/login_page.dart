// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:notapp/Component/my_Button.dart';
import 'package:notapp/Component/my_textFiled.dart';
import 'package:notapp/helper/Helper_Function.dart';

class login_page extends StatefulWidget {
  final void Function ()? onTap;

  login_page({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
    TextEditingController controllerEmail = TextEditingController();

  TextEditingController controllerPassword = TextEditingController();

void login()async{
      showDialog(
        context: context,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
   try {
        UserCredential? usercredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: controllerEmail.text, password: controllerPassword.text);
                Navigator.pop(context);
                

      }on FirebaseAuthException catch(error){
        Navigator.pop(context);
         ShowMessageToUser(context, "FirebaseError", error.toString());
            //  Navigator.pop(context);
      }
      
            

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.person,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(
              height: 25,
            ),
        const   Text(
              "M I N I M A L",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 50,
            ),
            my_textFiled(
                hinttext: "Email",
                obscureText: false,
                controllerl: controllerEmail),
            const SizedBox(
              height: 10,
            ),
            my_textFiled(
                hinttext: "PassWord",
                obscureText: true,
                controllerl: controllerPassword),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forget Password",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            MyBotton(text: "Login", onTap:login),
              const SizedBox(
              height: 25,
            ),
Row(mainAxisAlignment: MainAxisAlignment.center
,children: [
  Text("Don't have an account?",style:
                      TextStyle(color: Theme.of(context).colorScheme.inversePrimary),)
  ,GestureDetector(onTap: widget.onTap,child: Text(" Register Here",style: TextStyle(fontWeight: FontWeight.bold),))
],)

          ],
        ),
      )),
    );
  }
}
