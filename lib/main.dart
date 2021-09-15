import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyNotes',
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String myNote = "";
  List notesList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
            title: const Text(
                "NOTES+",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w100,
                  fontSize: 40.0,
                  letterSpacing: 10,
                )
            ),
            leading: IconButton(onPressed: () {
              showDialog(context: context, builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text(
                      "New Note", style: TextStyle(fontFamily: 'Lobster')),
                  content: TextField(
                    onChanged: (String value) {
                      myNote = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        onPressed: () {
                          setState(() {
                            notesList.add(myNote);
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                            "Add", style: TextStyle(fontFamily: 'Lobster')))
                  ],
                );
              });
            },
                icon: const Icon(Icons.add))
        ),

        body: Center(
          child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              width: 500,
              height: 500,
              child: ListView.builder(
                  itemCount: notesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(key: Key(notesList[index]),
                      child: Card(color: Colors.brown,
                          child: ListTile(
                            title: Text(notesList[index]),
                            trailing: IconButton(onPressed: () {
                              setState(() {
                                notesList.removeAt(index);
                              });
                            }, icon: Icon(Icons.delete, color: Colors.white)),
                          )
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          notesList.removeAt(index);
                        });
                      },
                    );
                  }
              )
          ),
        )
    );
  }
}


