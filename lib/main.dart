import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp6/app_screen/user_repo.dart';
import 'app_screen/login_screen.dart';
import 'app_screen/home_screen.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Sanitization App",
    home: FirstScreen()
  ));
}

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return FutureBuilder<FirebaseUser>(
        future: FirebaseAuth.instance.currentUser(),
        builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot){
          if (snapshot.hasData){

            FirebaseUser user = snapshot.data; // this is your user instance
            print("jji");
            print(user);
            /// is because there is user already logged
            return HomeScreen();
          }
          /// other way there is no user logged.
          return MyApp();
        }
    );
  }

}