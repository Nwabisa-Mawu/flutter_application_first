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
}
