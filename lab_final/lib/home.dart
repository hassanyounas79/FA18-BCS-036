// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final codekey = GlobalKey<FormState>();
  final verifykey = GlobalKey<FormState>();
  final passwordkey = GlobalKey<FormState>();
  String secCode = "a";
  String description = "";
  String password = "";
  bool valid = false;
  List<String> list = ["abc"];
  final ref = FirebaseDatabase.instance.ref();
  void newPasswordDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: Container(
              height: 350,
              width: MediaQuery.of(context).size.width - 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.all(20),
              child: Form(
                key: passwordkey,
                child: Column(
                  children: [
                    Text(
                      "Add new Password",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      onSaved: (str) {
                        description = str!;
                      },
                      validator: (str) {
                        if (str!.isEmpty) {
                          return "Please Enter Description";
                        }
                      },
                      decoration: InputDecoration(
                          label: Text("Enter Description"),
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 25),
                    TextFormField(
                      onSaved: (str) {
                        password = str!;
                      },
                      validator: (str) {
                        if (str!.isEmpty) {
                          return "Please Enter Password";
                        }
                      },
                      decoration: InputDecoration(
                          label: Text("Enter Password"),
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          var abc = passwordkey.currentState;
                          if (abc!.validate()) {
                            abc.save();
                            list.add(password);
                            Navigator.pop(_);
                            setState(() {});
                          }
                        },
                        child: Text("Verify"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void securityDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: Container(
              height: 250,
              width: MediaQuery.of(context).size.width - 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.all(20),
              child: Form(
                key: codekey,
                child: Column(
                  children: [
                    Text(
                      "Enter Security Code",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      onSaved: (str) {
                        secCode = str!;
                      },
                      validator: (str) {
                        if (str!.isEmpty) {
                          return "Please Enter Security Code";
                        }
                      },
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          var abc = codekey.currentState;
                          if (abc!.validate()) {
                            abc.save();
                            Navigator.pop(_);
                            newPasswordDialog();
                          }
                        },
                        child: Text("Verify"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: const [Colors.deepOrange, Colors.red])),
              currentAccountPicture: Image(
                image: AssetImage("images/R.png"),
              ),
              accountName: Text(
                "Hassan Younas",
              ),
              accountEmail: Text("FA18-BCS-036-A"),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: Text("Add new Password"),
              onTap: () {
                securityDialog();
              },
            ),
            ListTile(
              leading: Icon(Icons.upload),
              title: Text("Upload To Firebase"),
              onTap: () async {
                await ref.child("password").push().set(list);
              },
            ),
            ListTile(
              leading: Icon(Icons.upload),
              title: Text("Retrieve Password"),
              onTap: () async {
                var ds = await ref
                    .child("password")
                    .once()
                    .then((value) => value.snapshot);
                if (ds.exists && ds.value != null) {
                  Map temp = ds.value as Map;
                  temp.forEach((k, v) {
                    var tempList = v;
                    for (var pass in tempList) {
                      list.add(pass.toString());
                    }
                  });
                  setState(() {});
                }
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: verifykey,
              child: Column(
                children: [
                  Text(
                    "Enter Security Code",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    validator: (str) {
                      if (str!.isEmpty) {
                        return "Please Enter Security Code";
                      } else if (str != secCode) {
                        return "Icorrect Security Code";
                      }
                    },
                    decoration: InputDecoration(
                        label: Text("Enter Secutriy code"),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        var abc = verifykey.currentState;
                        if (abc!.validate()) {
                          setState(() {
                            valid = true;
                          });
                        }
                      },
                      child: Text("show"),
                    ),
                  ),
                ],
              ),
            ),
            Text("Passwords List"),
            valid
                ? Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (_, index) {
                          return ListTile(
                            title: Text(list[index]),
                          );
                        }),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  )
          ],
        ),
      ),
    );
  }
}
