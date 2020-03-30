import 'package:http/http.dart' as http;
import 'package:power_contest/models/jsonMeter.dart';
import 'dart:convert' as convert;

import 'package:power_contest/models/meter.dart';

Future<List<dynamic>> getRequest() async{
  String url = "http://35.245.130.207/meters/us/va/herndon/haverhill";

  //var client = http.Client();
  List<JsonMeter> meters;
  //print(response.statusCode);
  //var jsonResponse;
  //print("REACHED");
  http.Response response = await http.get(Uri.encodeFull(url));
  if (response.statusCode == 200) {
    Iterable list = convert.jsonDecode(response.body);
    meters = list.map((model) => JsonMeter.fromJson(model)).toList();
  } else {
     print('Request failed with status: ${response.statusCode}');
  }
  
  return meters;

}



Future<Map<String, dynamic>> signIn(String username, String password) async {

  var url = "http://35.245.130.207/getmeter?user=$username&password=$password";
  print(url);
  
  
  http.Response response = await http.get(Uri.encodeFull(url));


  print(response.body);
  if (response.statusCode == 200) {
    Map<String, dynamic> jason = convert.jsonDecode(response.body);
    Map<String, dynamic> toReturn = {};
    print(jason);
    if (jason["error"] == "user not found") {
      toReturn['boolean'] = false;
    } else {
      toReturn['boolean'] = true;
      toReturn['username'] = jason['username'];
      toReturn['meterID'] = jason['meter'];
    }

    return toReturn;
  }

}

Future<bool> signUp(String email, String password, String username, int meter) async {
  var url = "http://35.245.130.207/register?user=$username&password=$password&email=$email&meterid=$meter";
  print(url);

  http.Response response = await http.get(Uri.encodeFull(url));

  print(response.body);

  if (response.statusCode == 200) {
    if (response.body == "username taken") {
      return false;
    } else {
      return true;
    }

}
}

