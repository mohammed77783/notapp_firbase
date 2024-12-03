import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notapp/Component/Post_Botton.dart';
import 'package:notapp/Component/my_drawable.dart';
import 'package:notapp/Component/my_list_title.dart';
import 'package:notapp/Component/my_textFiled.dart';
import 'package:notapp/Services/firestore.dart';

class Wall_page extends StatelessWidget {
   Wall_page({super.key});
  TextEditingController controllerl=TextEditingController();
  final firestoreServices firestore=new  firestoreServices();
  void PostMessag() {
    if(!controllerl.text.isEmpty){
      // print("object");
      String message=controllerl.text.toString();
firestore.addPost(message);
controllerl.clear();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("W a l l"),
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      backgroundColor: Colors.transparent,
      elevation: 0,), 
      drawer: MyDrawer(),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child:Row(children: [ Expanded(child: my_textFiled(hinttext: "Say Something ...", obscureText: false, controllerl: controllerl))
         , PostBotton(onTap:PostMessag,)]),
        )
        ,
        StreamBuilder(stream: firestore.getPostStrem(), builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return CircularProgressIndicator();
          }
          final post=snapshot.data!.docs;
          if(snapshot.data==null ||post.isEmpty){
            return Padding(
              padding: const EdgeInsets.all(25.0),
              child: Center(child: Text("No Posting "),),
            );

          }
          return Expanded(child: ListView.builder(itemCount:post.length,itemBuilder: (context,index){
            final pos=post[index];
            String message=pos["UserEmail"];
            String userEmail=pos["postMessage"];
            Timestamp time=pos["timestemp"];
return Mylisttitle(message: message, userEmail:userEmail); 
          })
          );
        })
      ],),
    );
  }



}