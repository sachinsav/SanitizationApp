import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class UserData{
  final DBref = FirebaseDatabase.instance.reference();
  void WriteData({name,email,age,gender,password}) async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    print("user  == ");
    print(user);
    final uid = user.uid;
    // here you write the codes to input the data into firestore
    DBref.child("users").child(uid).set({
     "name" : name,
      "email" : email,
      "age" : age,
      "gender" : gender,
      "password" : password,
    });
  }
  Future<String> ReadData(String item) async{
    String msg=" ";
    var query = DBref.child('Items').child(item);
    DataSnapshot snap = await query.once();
  try {
// The snapshot will then be added to a Map
    Map<dynamic, dynamic> resultList = snap.value;
// Print to check the length of what's inside 'qwe'
    debugPrint('map length ${resultList.length}');

    resultList.forEach((key, values) {
      // Print the values inside 'qwe'
      debugPrint('$values');
      msg= values;
    });
  }catch(e){
    msg= "Given Item Not Found !!";
  }
  return msg;
  }
}