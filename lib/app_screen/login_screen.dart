import 'package:flutter/material.dart';
import 'package:flutterapp6/app_screen/home_screen.dart';
import 'signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    String _email,_password;
    final _formKey = new GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: Text("Sanitization App"),),
        body: Form(

            key: _formKey,
            child:Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),


                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(

                    validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
                    onSaved: (value) =>_email = value.trim(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',

                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    obscureText: true,
                    validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
                    onSaved: (value) => _password = value.trim(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('SignIn',
                      style: TextStyle(
                        fontSize: 20.0
                      ),),
                      onPressed: () {
                        //TODO: validation
                        final form = _formKey.currentState;
                        form.save();
                        if(form.validate()) {
                          fbsignin(_email, _password);
                        }

                      },
                    )),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Does not have account?'),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text(
                            'sign up',
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () {
                            //signup screen
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return SignUp();
                            }));
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
              ],
            ))));
  }
  Future<void> fbsignin(var email,var pwd) async{
    try {
      print(email);
      AuthResult authResult = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.toString().trim(), password: pwd.toString().trim());
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()),ModalRoute.withName("/Login"));
    }catch(e){
      print(e);
    }
  }
}

