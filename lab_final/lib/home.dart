// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void newPasswordDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: Container(
              height: 250,
              width: MediaQuery.of(context).size.width - 100,
              color: Colors.deepOrange[200],
              padding: EdgeInsets.all(20),
              child: Form(
                child: Column(
                  children: [
                    Text(
                      "Enter Security Code",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
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
              color: Colors.deepOrange[200],
              padding: EdgeInsets.all(20),
              child: Form(
                child: Column(
                  children: [
                    Text(
                      "Enter Security Code",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
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
              leading: Icon(Icons.arrow_right),
              title: Text("Small a-z"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
