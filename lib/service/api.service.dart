import 'dart:convert';

import 'package:http/http.dart' as http;

class CommonApiServices {
  static var client = http.Client();

// instead of local host we should declare machine Ip(10.0.2.2) - to run emulatore
  final baseUrl = 'http://10.0.2.2:8000/api/v1'; 

  Future<dynamic> fetchData(String apiUrl) async {
    var url = Uri.parse(baseUrl + apiUrl);
    print("urldata${url}");
      var header = {
        'Content-Type': 'application/json'
      };
      final response = await client.get(url, headers: header);
      if(response.statusCode == 200){
        print(json.decode(response.body));
        return response.body;
      } else {
        throw json.decode(response.body);
      }
  }

  Future<dynamic> saveData( String apiUrl, dynamic body) async {
    var url = Uri.parse(baseUrl + apiUrl);
    var header = {
        'Content-Type': 'application/json'
      };
      print("bodaydata${body}");

      final response = await client.post(url, body: body, headers: header);
      if (response.statusCode == 201){
        return response.body;
      } else {
        throw json.decode(response.body);
      }
    
  }

Future deleteData(String apiUrl) async {
  var url = Uri.parse(baseUrl + apiUrl);
    var header = {
        'Content-Type': 'application/json'
      };

      final response = await client.delete(url, headers: header);
      if (response.statusCode == 200){
        return response.body;
      } else {
        throw json.decode(response.body);
      }
}

}