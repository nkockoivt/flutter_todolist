import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todolist_app/models/Checklist.dart';

import 'main.dart';

class NewCheckList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: addNewChecklist(),
    );
  }
}

class addNewChecklist extends StatefulWidget {
  @override
  _addNewChecklistState createState() => _addNewChecklistState();
}
class _addNewChecklistState extends State<addNewChecklist> {
  Checklist checklist;
  List<Checklist> _list = List<Checklist>();
  TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add,),
      ),
    );
  }

  Stack buildBody() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: buildTitle(),
                ),
                buildAddButton(),
                buildMyChecklist(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container buildAddButton() {
    return Container(
                  padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
                  child: InkWell(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xfff96060),
                      ),
                      child: Center(
                        child: Text(
                          'Add',
                          style:
                              TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    onTap: () {
                      checklist=new Checklist('',false);
                      checklist.title = _titleController.text;
                      setState(() {
                        _list.add(checklist);
                        _titleController.text = '';
                      });
                    },
                  ));
  }

  Column buildTitle() {
    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Title",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    Container(
                      child: TextField(
                        controller: _titleController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff96060)),
                        )),
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xfff96060),
      title: Text(
        'New Checklist',
        style: TextStyle(fontSize: 25),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyApp()));
        },
      ),
    );
  }

  Container buildMyChecklist() {
    return Container(
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "My Checklist",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        padding: EdgeInsets.only(bottom: 10),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          height: 400,
                          child: ListView.builder(
                              padding: const EdgeInsets.all(8.0),
                              itemCount: _list.length,
                              itemBuilder: (BuildContext, int index) {
                                return Slidable(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xfff96060),
                                            width: 3.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: ListTile(
                                        title: Text(
                                          _list[index].title,
                                          style: TextStyle(
                                            color: Color(0xfff96060),
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  actionPane: SlidableDrawerActionPane(),
                                  actionExtentRatio: 0.3,
                                  secondaryActions: [
                                    IconSlideAction(
                                      caption: "Delete",
                                      color: Colors.red,
                                      icon: Icons.delete,
                                      onTap: () {
                                        setState(() {
                                          _list.removeAt(index);
                                        });
                                      },
                                    ),
                                  ],
                                );
                              })),
                    ],
                  ),
                );
  }
}
