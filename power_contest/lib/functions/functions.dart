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

void updateList(List<dynamic> json) {
  List<Meter> returnList;
  for (var jsonMeter in json) {
    print(jsonMeter);
    returnList.add(new Meter(id: jsonMeter["meterID"]));
  }

  //print(returnList);

}


