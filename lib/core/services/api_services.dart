import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class ApiServices {
  static postRequest({required String url, required Map data}) async {
    try {
      var response = await http.post(Uri.parse(url), body: data);

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);

        return responseBody;
      } else {
        print('Failure ${response.statusCode}');
      }
    } catch (e) {
      print("Error Catch $e");
    }
  }
}
