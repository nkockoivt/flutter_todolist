import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:table_calendar/table_calendar.dart';
import 'file:///D:/Android%20Projects/flutter_todolist-master/flutter_todolist-master/lib/sceens/NewCheckList.dart';
import 'file:///D:/Android%20Projects/flutter_todolist-master/flutter_todolist-master/lib/sceens/NewNote.dart';
import 'file:///D:/Android%20Projects/flutter_todolist-master/flutter_todolist-master/lib/sceens/NewTask.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _toDoListHomeScreen(),
    );
  }
}

class _toDoListHomeScreen extends StatefulWidget {
  @override
  __toDoListHomeScreenState createState() => __toDoListHomeScreenState();
}

class __toDoListHomeScreenState extends State<_toDoListHomeScreen> {
  String filterType="today";
  String taskPop="close";
  CalendarController ctrlr=new CalendarController();
  DateTime today=new DateTime.now();
  var monthNames=["JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEPT","OCT","NOV","DEC"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  Stack buildBody(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildAppBar(),
            buildHeader(),
            (filterType=="monthly")?TableCalendar(calendarController: ctrlr,
            startingDayOfWeek: StartingDayOfWeek.monday,
            initialCalendarFormat: CalendarFormat.week,
            ):Container(),
            buildTime(),
            buildListTask(),
            buildBottomNav(context),
          ],
        ),
        buildAddPopUp(context)
      ],
    );
  }

  Container buildAddPopUp(BuildContext context) {
    return Container(
        child: (taskPop=="open")?Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black.withOpacity(0.3),
          child: Center(
            child: InkWell(
              onTap: closeTaskPop,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white
                ),
                height: MediaQuery.of(context).size.height*0.3,
                width: MediaQuery.of(context).size.width*0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(height: 1,),
                    InkWell(
                      onTap: openNewTask,
                      child: Container(
                        child: Text("Add Task",style: TextStyle(
                          fontSize: 18
                        ),),
                      ),
                    ),
                    Container(
                      height: 1,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      color: Colors.black.withOpacity(0.2),
                    ),
                    InkWell(
                      onTap: openNewNote,
                      child: Container(
                        child: Text("Add Note",style: TextStyle(
                            fontSize: 18
                        ),),
                      ),
                    ),
                    Container(
                      height: 1,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      color: Colors.black.withOpacity(0.2),
                    ),
                    InkWell(
                      onTap: openNewCheckList,
                      child: Container(
                        child: Text("Add Checklist",style: TextStyle(
                            fontSize: 18
                        ),),
                      ),
                    ),
                    SizedBox(height: 1,)
                  ],
                ),
              ),
            ),
          ),
        ):Container(),
      );
  }

  Container buildBottomNav(BuildContext context) {
    return Container(
            height: 110,
            child: Stack(
              children: [
                Positioned(bottom: 0,
                    child: Container(
                      height: 90,
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xff292e4e),
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Icon(Icons.home,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 5,),
                                Text("Home",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),)
                              ],
                            ),
                          ),

                          Container(
                            child: Column(
                              children: [
                                Icon(Icons.check_circle,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 5,),
                                Text("My Task",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),)
                              ],
                            ),
                          ),


                          Container(width: 80,),

                          Container(
                            child: Column(
                              children: [
                                Icon(Icons.note,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 5,),
                                Text("Notes",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),)
                              ],
                            ),
                          ),

                          Container(
                            child: Column(
                              children: [
                                Icon(Icons.format_list_numbered,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 5,),
                                Text("Check List",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),)
                              ],
                            ),
                          ),




                        ],
                      ),
                    )),
                Positioned(bottom: 25,
                left: 0,
                right: 0,
                child: InkWell(
                  onTap: openTaskPop,
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xfff96060),Colors.red],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "+",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ))
              ],
            ),
          );
  }

  Expanded buildListTask() {
    return Expanded(child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                taskWidget(Color(0xfff96060),"Gặp bạn bè","9:00 AM"),
                taskWidget(Colors.blue,"Đi học","9:00 AM"),
                taskWidget(Colors.green,"Mua sắm","9:00 AM"),
                taskWidget(Colors.yellow,"Mua sắmmm","9:00 AM"),
              ],
            ),
          ));
  }

  Container buildTime() {
    return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Today ${monthNames[today.month-1]}, ${today.day}/${today.year}", style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),)
              ],
            ),
          );
  }

  Container buildHeader() {
    return Container(
            height: 70,
            color: Color(0xfff96060),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){changeFilter("today");},
                      child: Text("Today",style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: 4,
                      width: 120,
                      color: (filterType=="today")?Colors.white:Colors.transparent,
                    )
                  ],
                ),
                Column(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){changeFilter("monthly");},
                      child: Text("Monthly",style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                      ),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: 4,
                      width: 120,
                      color: (filterType=="monthly")?Colors.white:Colors.transparent,
                    )
                  ],
                )
              ],
            ),
          );
  }

  AppBar buildAppBar() {
    return AppBar(
            elevation: 0,
            backgroundColor: Color(0xfff96060),
            title: Text('Work List',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
          );
  }

  openTaskPop(){
    taskPop="open";
    setState((){

    });
  }

  closeTaskPop(){
    taskPop="close";
    setState((){

    });
  }

  void changeFilter(String filter) {
    filterType=filter;
    setState(() {

    });
  }

  void openNewTask() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>NewTask()));
  }

  void openNewNote() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>NewNote()));
  }

  void openNewCheckList() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>NewCheckList()));
  }
}

 Slidable taskWidget(Color color, String title, String time) {
  return Slidable(
      child: Container(
        height: 80,
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(
            color: Colors.black.withOpacity(0.03),
            offset: Offset(0,9),
            blurRadius: 20,
            spreadRadius: 1
          )]
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: color,
                width: 4)
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),),
                Text(time,style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),)
              ],
            ),
            Expanded(child: Container(),),
            Container(
              height: 50,
              width: 5,
              color: color,
            )
          ],
        ),
      ),
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.3,
    secondaryActions: [
      IconSlideAction(
        caption: "Done",
        color: Colors.green,
        icon: Icons.check,
        onTap: (){},
      ),
      IconSlideAction(
        caption: "Delte",
        color: Colors.red,
        icon: Icons.delete,
        onTap: (){},
      )
    ],
  );
}


