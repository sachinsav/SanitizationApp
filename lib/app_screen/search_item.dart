import 'package:flutter/material.dart';
import 'package:flutterapp6/app_screen/user_data.dart';

String message=" ";
class SearchItem extends StatefulWidget{
  @override
  _Item createState() => _Item();
}
class _Item extends State<SearchItem>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Items"),),
      body: getListView(context),
    );
  }
  Widget getListView(BuildContext context){
    TextEditingController search_item = TextEditingController();
    var listView = ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(7.0),
          padding: EdgeInsets.all(10.0),
          decoration:  BoxDecoration(
              border: Border.all(color: Colors.blueAccent)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                  child: TextField(
                    controller: search_item,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search Item",
                    ),
                  )),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: (){
                  getmsg(search_item.text.trim());
                },
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(13.0),
          child:Text(message,
          style: TextStyle(
            fontSize: 20,
            color: Colors.deepPurpleAccent,
          ),
          ) ,
        ),
      ],
    );
    return listView;
  }
Future<void> getmsg(String item) async{
    String tmp=await UserData().ReadData(item);
    setState(() {
      message=tmp;
    });
    print("msg = "+message);
}
}