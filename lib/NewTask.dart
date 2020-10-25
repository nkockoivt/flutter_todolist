import 'package:flutter/material.dart';
import 'package:todolist_app/main.dart';

class NewTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: newTask(),
    );
  }
}

class newTask extends StatefulWidget {
  @override
  _newTaskState createState() => _newTaskState();
}

class _newTaskState extends State<newTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xfff96060),
        elevation: 0,
        title: Text("New Task", style: TextStyle(
          fontSize: 25,
        ),),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));},
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10,),

            Container(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text("Title",style: TextStyle(
                      fontSize: 18,
                    ),),
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  
                  Container(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff96060)),
                        )
                      ),
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(30,10,30,10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                      child:
                      Text("Description",style: TextStyle(
                        fontSize: 18,
                      ),),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                      )
                    ),
                    child: TextField(
                      maxLines: 12,
                      decoration: InputDecoration(
                        hintText: "Type description here",
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}

