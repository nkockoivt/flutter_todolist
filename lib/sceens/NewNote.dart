import 'package:flutter/material.dart';

import 'main.dart';
import '../models/Note.dart';

class NewNote extends StatefulWidget {
  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: newNote(),
    );
  }
}

class newNote extends StatefulWidget {
  @override
  _newNoteState createState() => _newNoteState();
}

class _newNoteState extends State<newNote> {
  TextEditingController _titleeditingController= TextEditingController();
  TextEditingController _deseditingController= TextEditingController();
  Note note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          note=new Note(_titleeditingController.text,_deseditingController.text);
        },
        child: Icon(Icons.add),
      ),

    );
  }

  Stack buildBody() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10,),
                buildTitle(),
                buildDescription(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xfff96060),
      elevation: 0,
      title: Text("New Note", style: TextStyle(
        fontSize: 25,
      ),),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));},
      ),
    );
  }

  Container buildDescription() {
    return Container(
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
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.5),
                            )
                        ),
                        child: TextField(
                          controller: _deseditingController,
                          maxLines: 12,
                          decoration: InputDecoration(
                            hintText: "Type description here",
                            border: InputBorder.none,
                          ),
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                );
  }

  Container buildTitle() {
    return Container(
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
                          controller: _titleeditingController,
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
                );
  }
}


