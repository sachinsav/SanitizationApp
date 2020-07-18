import 'package:flutter/material.dart';
import 'package:flutterapp6/app_screen/user_repo.dart';
import 'package:flutterapp6/app_screen/login_screen.dart';
import 'package:flutterapp6/app_screen/search_item.dart';
import 'package:flutterapp6/app_screen/schedule_screen.dart';
class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text("Sanitization App"),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.all_out),
        onPressed: (){
          logout(context);
        },
      )
    ],
    ),
    body: getListView(context),
  );
  }

  Widget getListView(BuildContext context){
    var listView = ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.find_in_page),
          title: Text("Search"),
          subtitle: Text("Search An Item"),
          onTap: (){
            //TODO:: Search Item
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchItem()));
          },
        ),
        ListTile(
          leading: Icon(Icons.schedule),
          title: Text("Schedule"),
          subtitle: Text("Sechedule Your Day"),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Schedule();
            }));
          },
        ),
        ListTile(
          leading: Icon(Icons.forum),
          title: Text("Forum"),
          subtitle: Text("Discuss Your Doubt Here"),
          onTap: (){
            //TODO: Forum
          },
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text("Profile"),
          subtitle: Text("Manage Your Profile"),
          onTap: (){
            //TODO: profile

          },
        ),

      ],
    );
    return listView;
  }
  void logout(BuildContext context){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MyApp()),ModalRoute.withName("/Home"));
    UserRepo().signout();

  }
}