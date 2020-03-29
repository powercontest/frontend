import 'package:power_contest/models/user.dart';

class Community {
  List<User> members;
  String commName;
  int antID;

  Community({this.commName, this.members, this.antID});

  User getUser(int id) {
    for (User item in this.members) {
      if (item.meter.id == id) {
        return item;
      }
    }
  }
  
}

//below is the static data to be used in modeling the UI

Community sampleComm = Community(commName: "Harrington", members: commMembers, antID: 51276197);