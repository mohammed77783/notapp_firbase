// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:notapp/Component/my_Button.dart';
import 'package:notapp/Component/my_textFiled.dart';
import 'package:notapp/helper/Helper_Function.dart';

class register_page extends StatefulWidget {
  final void Function()? onTap;

  register_page({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  State<register_page> createState() => _register_pageState();
}

class _register_pageState extends State<register_page> {
  TextEditingController controllerUsername = TextEditingController();

  TextEditingController controllerEmail = TextEditingController();

  TextEditingController controllerPassword = TextEditingController();

  TextEditingController controllerConfirmPassword = TextEditingController();
  Future <void> createUserDocumern(UserCredential? usercredential) async {
    if(usercredential!=null && usercredential.user!=null){
      await FirebaseFirestore.instance.collection("Users").doc(usercredential.user!.email).set({
        'email':usercredential.user!.email,
            'username':controllerUsername.text,

      });

    }
  }
  void RegisterUser() async {
//show loading
    showDialog(
        context: context,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
    if (controllerPassword.text == controllerConfirmPassword.text) {
      // Proceed with registration logic
      try {
        UserCredential? usercredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: controllerEmail.text, password: controllerPassword.text);
              
    
createUserDocumern(usercredential);
if(context.mounted){
  Navigator.pop(context);
    //  widget.onTap;
}
   
      }on FirebaseAuthException catch(error){
         ShowMessageToUser(context, "FirebaseError", error.toString());
      }
    } 
    else 
    {
      // Show error message
      Navigator.of(context).pop(); // Close the loading dialog
      ShowMessageToUser(context, "Error", "Passwords do not match.");
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
            const Text(
              "M I N I M A L",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 50,
            ),
            my_textFiled(
                hinttext: "UserName",
                obscureText: false,
                controllerl: controllerUsername),
            const SizedBox(
              height: 10,
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
            my_textFiled(
                hinttext: "confirm Password",
                obscureText: true,
                controllerl: controllerConfirmPassword),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forget Password",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            MyBotton(text: "Register", onTap: RegisterUser),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(" logIn Here",
                        style: TextStyle(fontWeight: FontWeight.bold)))
              ],
            )
          ],
        ),
      )),
    );
  }
  

}
