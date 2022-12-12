import 'dart:async';
import 'dart:convert';
import 'package:mobile/models/hire.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/models/api_response.dart';
import 'package:mobile/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';


Future<Hire> createHire(int carId, String start, String end, double totalAmount) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("token");
  final response = await http.post(
    Uri.parse(hireURL),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    },
    body: jsonEncode(<String, String>{
      'car_id': carId.toString(),
      'start': start,
      'end': end,
      'amount': totalAmount.toString(),
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.
    return Hire.fromJson(jsonDecode(response.body));


  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create hire.');
  }
}

Future<Hire> fetchData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("token");
  var response = await http.get(Uri.parse(viewHireURL),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    });
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    return Hire.fromJson(data);
  } else {
    return Hire.fromJson(data);
  }
}
