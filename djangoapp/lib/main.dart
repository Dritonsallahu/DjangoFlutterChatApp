import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'note.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Client client = http.Client();
  List<Note> notes = [];

  @override
  void initState() {
    retreiveNotes();
    super.initState();
  }

  retreiveNotes() async {
    Uri url = Uri.parse("http://127.0.0.1:8000/notes/");

    notes = [];
    var link = await client.get(url);
    List response = json.decode((link).body);
    response.forEach((element) {
      print(element);
      var n1 = new Note(id: element['id'], note: element['body']);
      notes.add(n1);
    });
    setState(() {});
  }

  addNote() {}

  @override
  Widget build(BuildContext context) {
    print(notes.length);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notes[index].note!),
            subtitle: Text("This has to change"),
            leading: CircleAvatar(
              child: Center(child: Text(notes[index].note!.split("")[0]),),
              backgroundColor: Colors.blueAccent,
            ),
            trailing: Icon(Icons.delete),
          );
        },
        itemCount: notes.length,
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          retreiveNotes();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
