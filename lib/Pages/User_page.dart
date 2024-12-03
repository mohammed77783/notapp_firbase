
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notapp/Component/back_Button.dart';
import 'package:notapp/Component/my_list_title.dart';
import 'package:notapp/helper/Helper_Function.dart';

class User_page extends StatelessWidget {
  const User_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
        backgroundColor: Theme.of(context).colorScheme.background,
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Users").snapshots(),
          builder: (context,snapshot){
            if(snapshot.hasError){
              ShowMessageToUser(context,"Error","There is Error");
            }
            if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(snapshot.data==null){
              return const Text("No Data");
            }
                final users=snapshot.data!.docs;
                return  Column(
                  children: [
      Padding(
                    padding: const EdgeInsets.only(top:50,left: 25),
                    child: Row(
                      children: [
                        back_Button(),
                      ],
                    ),
                  ),
                    
                    Expanded(
                      child: ListView.builder(itemCount: users.length,itemBuilder: (context,index){
                        final user=users[index];
                        return Mylisttitle(message:user['email'],
                        userEmail:user['username'] ,);
                      },),
                    ),
                  ],
                );
          },
        ),
        
    );
  }
}