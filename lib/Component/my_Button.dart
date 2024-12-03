// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyBotton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  MyBotton({
    Key? key,
    required this.text,
   required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)
        ),
        padding: EdgeInsets.all(25),
        child: Center(child: Text(text,style:const   TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
      ),
    );
  }
}
