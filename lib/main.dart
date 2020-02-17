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

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _priorityController = TextEditingController();
  TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(59, 65, 84, 1.0),
      appBar: makeAppBar,
      bottomNavigationBar: makeBottom,
      body: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: getTasks.length,
          itemBuilder: (BuildContext context, int index) {
            return makeCard(getTasks[index]);
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          return showDialog(
            context: context, 
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                actions: <Widget>[
                  FlatButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                      _priorityController.clear();
                      _titleController.clear();
                      _valueController.clear();
                    },
                    child: Text('CANCEL', style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                  FlatButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                      setState(() {
                        getTasks.add(
                          Task(
                          indicatorValue: double.parse(_valueController.text), 
                          title: _titleController.text, 
                          priority: _priorityController.text
                          )
                        );
                        print(getTasks.length);
                      });
                    },
                    child: Text('ADD', style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                ],
                backgroundColor: Color.fromRGBO(59, 67, 88, 1.0),
                title: Column(
                  children: <Widget>[
                    Center(
                      child: Text('Add a new task', style: TextStyle(
                        color: Colors.white
                      ),)
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      textInputAction: TextInputAction.next,
                      controller: _titleController,
                      decoration: InputDecoration(
                        hintText: "Enter Task",
                        hintStyle: TextStyle(
                          color: Colors.white
                        )
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    TextField(
                      textInputAction: TextInputAction.next,
                      controller: _priorityController,
                      decoration: InputDecoration(
                        hintText: "Enter Priority",
                        hintStyle: TextStyle(
                          color: Colors.white
                        )
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    TextField(
                      textInputAction: TextInputAction.done,
                      controller: _valueController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Enter Progress Value",
                        hintStyle: TextStyle(
                          color: Colors.white
                        )
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              );
            }
          );
        },
        child: Icon(Icons.add,),
        backgroundColor: Color.fromRGBO(59, 67, 88, 1.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
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
  ]
);

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


 Card makeCard(Task task) => Card(
  key: ValueKey(task.title),
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

