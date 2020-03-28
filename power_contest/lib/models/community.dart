import 'package:power_contest/models/user.dart';

class Community {
  List<User> members;
  String commName;

  Community({this.commName, this.members});

  User getUser(int id) {
    for (User item in this.members) {
      if (item.meter.id == id) {
        return item;
      }
    }
  }
  
}

//below is the static data to be used in modeling the UI

Community sampleComm = Community(commName: "Memory Lane", members: commMembers);