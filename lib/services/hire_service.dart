import 'dart:async';
import 'dart:convert';
import 'package:mobile/models/hire.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';

Future<Hire> createHire(String start, String end) async {
  final response = await http.post(
    Uri.parse(hireURL),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'start': start,
      'end': end,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Hire.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create hire.');
  }
}
