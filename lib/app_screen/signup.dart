import 'package:flutter/material.dart';
import 'package:flutterapp6/app_screen/home_screen.dart';
import 'package:flutterapp6/app_screen/login_screen.dart';
import 'package:flutterapp6/app_screen/user_data.dart';
import 'package:flutterapp6/app_screen/user_repo.dart';


class SignUp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController cnfpasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',

                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',

                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: ageController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Age',

                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: genderController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Gender',

                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: cnfpasswordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
                    ),
                  ),
                ),

                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    margin: EdgeInsets.only(top: 20),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('SignUp',
                        style: TextStyle(
                            fontSize: 20.0
                        ),),
                      onPressed: () {
                        print(nameController.text);
                        print(emailController.text);
                        print(ageController.text);
                        print(genderController.text);
                        print(passwordController.text);
                        print(cnfpasswordController.text);
                        Signupfuture();

                      },
                    )),

              ],
            )));
  }
  Future<void> Signupfuture() async{
    await UserRepo().signup(emailController.text.trim(), passwordController.text.trim());
    await UserData().WriteData(name: nameController.text.trim(),email: emailController.text.trim(),
        age: ageController.text.trim(),gender: genderController.text.trim(),password: passwordController.text.trim());
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) => MyApp(),), (route) => false);
  }
}

