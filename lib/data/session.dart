class Session {
  // session identifier
  int id = 0;
  String date = '';
  String description = '';
  int duration = 0;

  // unnamed constructor that will set all the above fields
  Session(this.id, this.date, this.description, this.duration);

  // create a constructor that will create a session object from the data above
  Session.fromJson(Map<String, dynamic> sessionMap) {
    id = sessionMap['id'] ?? 0;
    date = sessionMap['date'] ?? '';
    description = sessionMap['description'] ?? '';
    duration = sessionMap['duration'] ?? 0;
  }

  // method to transform a session object into a map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'description': description,
      'duration': duration,
    };
  }
}
