// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Mylisttitle extends StatelessWidget {
  final String message;
 final String userEmail;
  Mylisttitle({
    Key? key,
    required this.message,
    required this.userEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
padding: const EdgeInsets.only(left:10,right: 10,bottom: 10),
child:   Container(decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary,
borderRadius:  BorderRadius.circular(12)),
  child:   ListTile(
  
    subtitle: Text(message,style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
  
    title: Text(userEmail ,),
  
  
  
  
  
  
  
  ),
))
;
  }
}
