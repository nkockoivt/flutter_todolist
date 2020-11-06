import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/Android%20Projects/flutter_todolist-master/flutter_todolist-master/lib/sceens/main.dart';

import '../models/Task.dart';

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
  bool pickDateTime = false;
  String selectedColor = "blue";
  DateTime today = DateTime.now();
  var monthNames = [
    "JAN",
    "FEB",
    "MAR",
    "APR",
    "MAY",
    "JUN",
    "JUL",
    "AUG",
    "SEPT",
    "OCT",
    "NOV",
    "DEC"
  ];
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  Task task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          task = new Task(_titleController.text, _descriptionController.text,
              selectedColor, today);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Stack buildBody(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                buildTitle(),
                buildDescription(),
                buildTime(),
                buildColor(),
              ],
            ),
          ),
        ),
        buildTimePicker(context),
      ],
    );
  }

  Container buildColor() {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Color",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          color: (selectedColor == "blue")
                              ? Colors.blue[800]
                              : Colors.white,
                          width: 2.5),
                      color: Colors.blue,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedColor = "blue";
                    });
                  },
                ),
                GestureDetector(
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          color: (selectedColor == "red")
                              ? Colors.blue[800]
                              : Colors.white,
                          width: 2.5),
                      color: Colors.red,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedColor = "red";
                    });
                  },
                ),
                GestureDetector(
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          color: (selectedColor == "yellow")
                              ? Colors.blue[800]
                              : Colors.white,
                          width: 2.5),
                      color: Colors.yellow,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedColor = "yellow";
                    });
                  },
                ),
                GestureDetector(
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          color: (selectedColor == "green")
                              ? Colors.blue[800]
                              : Colors.white,
                          width: 2.5),
                      color: Colors.green,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedColor = "green";
                    });
                  },
                ),
                GestureDetector(
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          color: (selectedColor == "purple")
                              ? Colors.blue[800]
                              : Colors.white,
                          width: 2.5),
                      color: Colors.purple,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedColor = "purple";
                    });
                  },
                ),
                GestureDetector(
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          color: (selectedColor == "tealAccent")
                              ? Colors.blue[800]
                              : Colors.white,
                          width: 2.5),
                      color: Colors.tealAccent,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedColor = "tealAccent";
                    });
                  },
                ),
                GestureDetector(
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          color: (selectedColor == "orangeAccent")
                              ? Colors.blue[800]
                              : Colors.white,
                          width: 2.5),
                      color: Colors.orangeAccent,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedColor = "orangeAccent";
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildTimePicker(BuildContext context) {
    return Container(
      child: (pickDateTime == true)
          ? Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black.withOpacity(0.3),
              child: Center(
                child: InkWell(
                  onTap: closeDateTimePicker,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 200,
                          child: CupertinoDatePicker(
                            initialDateTime: today,
                            use24hFormat: true,
                            onDateTimeChanged: (dateTime) {
                              setState(() {
                                today = dateTime;
                              });
                            },
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {
                            closeDateTimePicker();
                          },
                          child: Text('OK'),
                        )
                      ],
                    ),
                  ),
                ),
              ))
          : Container(),
    );
  }

  Container buildTime() {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Time",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "${monthNames[today.month - 1]}, ${today.day}/${today.year} - ${today.hour}:${today.minute}",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.date_range),
                  color: Colors.blue[800],
                  onPressed: () {
                    openDateTimePicker();
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildDescription() {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Description",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
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
                )),
            child: TextField(
              controller: _descriptionController,
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
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xfff96060),
      elevation: 0,
      title: Text(
        "New Task",
        style: TextStyle(
          fontSize: 25,
        ),
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

  void openDateTimePicker() {
    pickDateTime = true;
    setState(() {});
  }

  void closeDateTimePicker() {
    pickDateTime = false;
    setState(() {});
  }
}
