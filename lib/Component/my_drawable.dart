import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
void logout(){
  FirebaseAuth.instance.signOut();
}
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            DrawerHeader(
                child: Icon(
              Icons.favorite,
              color: Theme.of(context).colorScheme.inversePrimary,
            )),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.only(left:25.0),
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: Text("H O M E"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            )
           , Padding(
              padding: const EdgeInsets.only(left:25.0),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: Text("P R O F I L E"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/profile');
                },
              ),
            )
          , Padding(
              padding: const EdgeInsets.only(left:25.0),
              child: ListTile(
                leading: Icon(
                  Icons.group,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: Text("U S E R"),
                onTap: () {
                  Navigator.pop(context);
                     Navigator.pushNamed(context, '/user_page');
                },
              ),
            )
          , Padding(
              padding: const EdgeInsets.only(left:25.0),
              child: ListTile(
                leading: Icon(
                  Icons.group,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: Text("W A L L"),
                onTap: () {
                  Navigator.pop(context);
                     Navigator.pushNamed(context, '/wall');
                },
              ),
            )
          ]),
             Padding(
              padding: const EdgeInsets.only(left:25.0,bottom: 25),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: Text("L O G O U T"),
                onTap: () {
                  Navigator.pop(context);
                logout();
                },
              ),
            )
     ,
     ] ),
    );
  }
}
