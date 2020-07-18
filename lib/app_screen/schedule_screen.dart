import 'package:flutter/material.dart';

class Schedule extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Schedule Manager"),
      elevation: 5,),
      body: Screen1(),
    );
  }
}
class Screen1 extends StatefulWidget{
  @override
  Screen createState() => Screen();
}
String current_time=" ";
TextEditingController addresscontroller = TextEditingController();
class Screen extends State<Screen1>{
  @override
  Widget build(BuildContext context){
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 2),
          padding: EdgeInsets.only(top: 7,bottom: 7),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent)
          ),
          child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.access_time),
              color: Colors.blueAccent,
              iconSize: 35,
              onPressed: (){
                TimeOfDay _time = TimeOfDay.now();
                selectTime(context, _time);
              },
            ),
            Text(current_time,
            style: TextStyle(fontSize: 22,
              color: Colors.blueAccent
            ),),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 7.0),
                child:TextField(
                controller: addresscontroller,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter Location Here"
                ),
              ),
            )),
            FlatButton(
              textColor: Colors.blue,
              child: Text('Add',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {

              },
            )
          ],
        )),
        Container(
          height: 20,
        ),
        Row(
          children: <Widget>[
            InkWell(child:Container(
              width: 250,
              height: 100,
              margin: EdgeInsets.only(left: 70),
              padding: EdgeInsets.all(5.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.blueAccent,
                elevation: 10,
                child: Center(child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.edit, size: 40,color: Colors.white,),
                      title: Text('Edit Schedule', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                    ),],),),),),
              onTap: (){
                print("clicked");
              },)
          ],
        ),
        Row(
          children: <Widget>[
            InkWell(child:Container(
              width: 200,
              height: 100,
              padding: EdgeInsets.all(5.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.blueAccent,
                elevation: 10,
                child: Center(child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.receipt, size: 40,color: Colors.white,),
                      title: Text('All Schedule', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                    ),],),),),),
            onTap: (){
              print("clicked");
            },),
            InkWell(child:Container(
              width: 200,
              height: 100,
              padding: EdgeInsets.all(5.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.blueAccent,
                elevation: 10,
                child: Center(child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.delete, size: 40,color: Colors.white,),
                      title: Text('Delete Schedule', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                    ),],),),),),
              onTap: (){
                print("clicked");
              },),
          ],
        ),

      ],
    );
  }
  Future<Null> selectTime(BuildContext context,time) async{
    TimeOfDay picked = await showTimePicker(context: context, initialTime: time);
    setState(() {
      current_time=picked.hour.toString()+":"+picked.minute.toString();
      print(current_time);
    });
  }
}