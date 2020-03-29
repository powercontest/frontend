import 'meter.dart';
class User {
  String username;
  Meter meter;

  User({this.username, this.meter});
}


//below is the static data to be used in modeling the UI
List<User> commMembers = [
  User(username: "Yoseph", meter: meters[0]),
  User(username: "Dhruv", meter: meters[1]),
  User(username: "Luis", meter: meters[2]),
  User(username: "Carolina", meter: meters[3]),
];