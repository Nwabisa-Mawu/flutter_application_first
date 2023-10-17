// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import '../data/sp_helper.dart';
import '../data/session.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({super.key});

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  // variable to hold the saved sessions for display in the UI
  List<Session> sessions = [];
  //textcontroller to get the input from the alert dialog
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtDuration = TextEditingController();
  // create an instance of sp helper to save the sessions
  final SPHelper helper = SPHelper();

  @override
  void initState() {
    helper.init().then((value) {
      updateScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Training Sessions'),
      ),
      // to show the sessions, add a ListView widget that has a method to populate it with the information from the sessions list.
      body: ListView(children: getContent()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showSessionDialog(context);
        },
      ),
    );
  }

// this shows the dialog when the add button on the page is clicked
  Future<dynamic> showSessionDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Insert Training Session'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: txtDescription,
                    decoration: InputDecoration(hintText: 'Description'),
                  ),
                  TextField(
                    controller: txtDuration,
                    decoration: InputDecoration(hintText: 'Duration'),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    txtDescription.text = '';
                    txtDuration.text = '';
                  },
                  child: Text('Cancel')),
              ElevatedButton(onPressed: saveSession, child: Text('Save'))
            ],
          );
        });
  }

  // create the asynchronous save session method
  Future saveSession() async {
    DateTime now = DateTime.now();
    String today = '${now.year}-${now.month}-${now.day}';

    Session newSession = Session(
        1, today, txtDescription.text, int.tryParse(txtDuration.text) ?? 0);
    // this method will write the new session in the shared preferences
    helper.writeSession(newSession);
    txtDescription.text = '';
    txtDuration.text = '';
    Navigator.pop(context);
  }

  // method to display the saved sessions on the UI
  List<Widget> getContent() {
    List<Widget> tiles = [];
    sessions.forEach((session) {
      tiles.add(ListTile(
        title: Text(session.description),
        subtitle: Text('${session.date} - duration: ${session.duration} min'),
      ));
    });
    return tiles;
  }

  // method to update the UI when a new session is added
  void updateScreen() {
    sessions = helper.getSessions();
    setState(() {});
  }
}
