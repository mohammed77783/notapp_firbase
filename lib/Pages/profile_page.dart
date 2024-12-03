import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notapp/Component/back_Button.dart';

class Profile_page extends StatelessWidget {
  Profile_page({super.key});

  final User? currentUser = FirebaseAuth.instance.currentUser;
  Future<DocumentSnapshot<Map<String, dynamic>>> getuserDetails() async {
    // Add a return statement to avoid the lint error
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getuserDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (snapshot.hasData) {
            Map<String, dynamic>? user = snapshot.data!.data();
            return Center(
              child: Column(
             
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:50,left: 25),
                    child: Row(
                      children: [
                        back_Button(),
                      ],
                    ),
                  ),
                  SizedBox(height: 25,),
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(24)),
                    child: Icon(Icons.person,size: 64,),
                    padding: const EdgeInsets.all(25),
                  ),
                  SizedBox(height:  25,),
                    Text(user!['username'],style: TextStyle(fontSize: 24,
                  fontWeight: FontWeight.bold)),
                  Text(user!['email'],style: TextStyle(color: Colors.grey[600 ]),),
                      SizedBox(height:  25,),
                
                ],
              ),
            );
          } else {
            return Text("No Idea");
          }
        },
      ),
    );
  }
}
