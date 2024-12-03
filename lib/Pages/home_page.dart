import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notapp/Component/my_drawable.dart';
import 'package:notapp/Services/firestore.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final firestoreServices firestore=new  firestoreServices();
  final TextEditingController textcontroller = TextEditingController();
  void showNoteBos({String? douID}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: textcontroller,
              ),
              actions: [ElevatedButton(onPressed: (){
               
                if(douID==null){
                 firestore.addnote(textcontroller.text);
                }
                else{
                  firestore.update(douID, textcontroller.text); 
                }
                textcontroller.clear();
                Navigator.pop(context);
              }, child: Text("ADD"))],
            ));
  }
void logout(){
  FirebaseAuth.instance.signOut();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Theme.of(context).colorScheme.inversePrimary,   
        title: Padding(
          padding: const EdgeInsets.only(left:100.0),
          child: Text("Notes"),
        ),
        elevation: 0,
    //  actions: [
    //   IconButton(onPressed: logout, icon: Icon(Icons.logout))
    //  ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showNoteBos,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.getNotStrem(),
        builder: (context,snapshot){
          if(snapshot.hasData){
List notlist=snapshot.data!.docs;
return  ListView.builder(
  itemCount: notlist.length,
  itemBuilder: (context,index){
    DocumentSnapshot document=notlist[index];
    String docID=document.id;
    Map<String,dynamic>data=document.data() as Map<String ,dynamic>;
    String nottext=document['note'];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary,
borderRadius:  BorderRadius.circular(12)),
        child: ListTile(
          title: Text(nottext),
          trailing: Row(mainAxisSize: MainAxisSize.min,
            children: [
            IconButton(onPressed:()=>showNoteBos(douID: docID),icon:Icon(Icons.settings)),
            IconButton(onPressed:()=>firestore.DeletNote(docID),icon:Icon(Icons.delete))
          ]),
        ),
      ),
    );
  },
);
          }
          else{
            return Text("Loading .....");
          }
          
          },
      ),
    
    drawer: MyDrawer(),
    );
  }
}
