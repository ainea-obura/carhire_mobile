import 'dart:async';
import 'dart:convert';
import 'package:mobile/models/cars.dart';
import 'package:http/http.dart' as http;

Future<Car> fetchData() async {
  var response =
      await http.get(Uri.parse('http://192.168.8.160:8000/api/cars'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    return Car.fromJson(data);
  } else {
    return Car.fromJson(data);
  }
}
