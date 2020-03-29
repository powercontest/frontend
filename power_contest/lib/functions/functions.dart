import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future<List> getRequest() async{
  String url = "http://35.245.130.207/meters/us/va/herndon/haverhill";

  //var client = http.Client();
  
  //print(response.statusCode);
  var jsonResponse;
  //print("REACHED");
  http.Response response = await http.get(Uri.encodeFull(url));
  if (response.statusCode == 200) {
    jsonResponse = convert.jsonDecode(response.body);
    //print(jsonResponse);
  } else {
    print('Request failed with status: ${response.statusCode}.                                                                                             ENDEEEEEEEE');
  }
  
  return jsonResponse as List;

}


