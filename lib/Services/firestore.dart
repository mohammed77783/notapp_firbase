import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// Start Generation Here

class firestoreServices{
  //get data
  final CollectionReference nots = FirebaseFirestore.instance.collection('notes');
  //Create
  Future<void> addnote(String note){
    return nots.add(
      {
        'note':note,
        'timestemp':Timestamp.now()
      }
    );
  }
  //read
Stream<QuerySnapshot>getNotStrem(){
  final notStream=nots.orderBy('timestemp',descending: true).snapshots();
  return notStream;
}
//update 
Future<void> update(String douId,String  newnote){
  return nots.doc(douId).update(
{'note':newnote,
'timestemp':Timestamp.now()}
  );
}



  //Delete
Future<void>DeletNote(String docId){
  return nots.doc(docId).delete();
}


User? user=FirebaseAuth.instance.currentUser;
final CollectionReference posts=FirebaseFirestore.instance.collection('Post');


Future<void> addPost(String message){
    return posts.add(
      {
        'UserEmail':user!.email,
        'postMessage':message,
        'timestemp':Timestamp.now()
      }
    );
  }

  Stream<QuerySnapshot> getPostStrem(){
    final postStream=FirebaseFirestore.instance.collection("Post").orderBy("timestemp",descending: true).snapshots();
    return postStream; 
  }
  








}