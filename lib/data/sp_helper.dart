// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:shared_preferences/shared_preferences.dart';
import './session.dart';
import 'dart:convert';

// the purpose of this class is to act as an interface between our code and shared preferences
class SPHelper {
  // create a static instance so that it call the same thing everytime
  static late SharedPreferences prefs;

  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  // method that writes a new session into shared preferences
  Future writeSession(Session session) async {
    prefs.setString(session.id.toString(), json.encode(session.toJson()));
  }

  // method to retrieve all sessions saved into shared preferences - this method is not asynchronous
  List<Session> getSessions() {
    List<Session> sessions = [];
    // used a set because shared preferences returns an unordered list, list is used for an ordered list.
    Set<String> keys = prefs.getKeys();
    keys.forEach((String key) {
      Session session =
          Session.fromJson(json.decode(prefs.getString(key) ?? ''));
      // add the session object to the session list
      sessions.add(session);
    });
    return sessions;
  }

  // method that will create a key counter to allow for the display of more than one session on the UI
  Future setCounter() async {
    int counter = prefs.getInt('counter') ?? 0;
    counter++;
    await prefs.setInt('counter', counter);
  }
}
