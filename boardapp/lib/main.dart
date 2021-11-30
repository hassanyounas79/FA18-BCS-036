// ignore_for_file: avoid_print, non_constant_identifier_names, unused_element

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:myapp/board.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Board App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _auth = FirebaseAuth.instance;
  final fdb = FirebaseDatabase.instance;
  final key = GlobalKey<FormState>();
  String? subject;
  String? body;
  Board? board;
  List<Board> message = [];
  @override
  void initState() {
    super.initState();
    fdb
        .reference()
        .child("detail")
        .push()
        .set({"subject": "this is subject", "body": "this is body"});
    fdb.reference().child("detail").onChildAdded.listen((event) {
      setState(() {
        message.add(Board.fromSnapshot(event.snapshot));
      });
      fdb.reference().child("detail").onChildChanged.listen((event) {
        var old = message.singleWhere((entry) {
          return entry.key == event.snapshot.key;
        });
        setState(() {
          message[message.indexOf(old)] = Board.fromSnapshot(event.snapshot);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Form(
              key: key,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      alignLabelWithHint: true,
                      label: Text("Subject"),
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (str) {
                      subject = str;
                    },
                    validator: (str) {
                      if (str!.isEmpty) {
                        return "Subject is Required";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      alignLabelWithHint: true,
                      label: Text("Body"),
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (str) {
                      body = str;
                    },
                    validator: (str) {
                      if (str!.isEmpty) {
                        return "Body is Required";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var state = key.currentState;
                      if (state!.validate()) {
                        var ref = fdb.reference().child("detail");
                        state.save();
                        state.reset();
                        ref.push().set(Board(subject!, body!).toJson());
                      }
                    },
                    child: const Text("Submit"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FirebaseAnimatedList(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, DataSnapshot snapshot,
                        Animation<double> animation, int index) {
                      return Card(
                        child: ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: Colors.orange,
                            ),
                            title: Text(message[index].subject),
                            subtitle: Text(message[index].body)),
                      );
                    },
                    query: fdb.reference().child("detail"),
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
