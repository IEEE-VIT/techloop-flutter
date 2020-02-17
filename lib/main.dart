import 'package:flutter/material.dart';
import 'package:flutter_techloop/tasks.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(59, 65, 84, 1.0),
        appBar: makeAppBar,
        bottomNavigationBar: makeBottom,
        body: makeBody);
  }
}

final makeAppBar = AppBar(
    elevation: 5,
    backgroundColor: Color.fromRGBO(59, 67, 88, 1.0),
    title: Text("To-Do List"),
    centerTitle: true,
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.list),
        onPressed: () {},
      )
    ]);

final makeBottom = Container(
  height: 55.0,
  child: BottomAppBar(
    color: Color.fromRGBO(58, 66, 86, 1.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.home, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.blur_on, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.hotel, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.account_box, color: Colors.white),
          onPressed: () {},
        )
      ],
    ),
  ),
);

final makeBody = Container(
  child: ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: getTasks.length,
    itemBuilder: (BuildContext context, int index) {
      return makeCard(getTasks[index]);
    },
  ),
);

 Card makeCard(Task task) => Card(
  elevation: 8.0,
  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
  child: Container(
    decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
    child: makeListTile(task),
  ),
);

ListTile makeListTile(Task task) => ListTile(
  contentPadding:
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
  leading: Container(
    padding: EdgeInsets.only(right: 12.0),
    decoration: new BoxDecoration(
        border: new Border(
            right: new BorderSide(width: 1.0, color: Colors.white24))),
    child: Icon(Icons.edit, color: Colors.white),
  ),
  title: Text(
    task.title,
    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  ),


  subtitle: Row(
    children: <Widget>[
      Expanded(
        flex: 1,
        child: Container(
          child: LinearProgressIndicator(
            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
            value: task.indicatorValue,
            valueColor: AlwaysStoppedAnimation(Colors.green)),
        )),
      Expanded(
        flex: 4,
        child: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(task.priority,
            style: TextStyle(color: Colors.white))),
        )
      ],
    ),
  trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
);

