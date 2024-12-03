import 'package:flutter/material.dart';

 void ShowMessageToUser(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) =>
         AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        )
      
    );
  }
