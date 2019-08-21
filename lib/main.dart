import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //List<String> list = ["Jordan", "Honey", "Series", "Game Of Thrones"];
  Set<int> taskData = Set<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Flutter"),
      ),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return buildList(context, index);
        },
      ),

    );
  }

  Widget buildList(context, index) {
    bool hasData = taskData.contains(index);
    return ListTile(
      leading: IconButton(icon: Icon(

          hasData?Icons.check_circle: Icons.assignment),
           color: hasData?Colors.green: Colors.deepPurple,
           highlightColor: Colors.greenAccent,
           iconSize: 30.0,
           onPressed: (){
        setState(() {
          taskData.add(index);
        });
        showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Task Completed!!"),
            content: Text("Congrats!! You have completed the task No. $index!!!"),
          );
        }
        );
           }),
      title: Text(
        "Task ${index + 1}",
        style: TextStyle(fontSize: 18.0,
        fontWeight: FontWeight.w400),
      ),
    );
  }
}
