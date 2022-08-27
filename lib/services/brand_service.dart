//import 'dart:async';

import 'dart:convert';

import 'package:mobile/constant.dart';
import 'package:mobile/models/brands.dart';
import 'package:http/http.dart' as http;


class BrandService {
  Future<List<Brand>?> getBrands() async {
    var client = http.Client();
    var uri = Uri.parse(brandsURL);
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return brandFromJson(json);
    }
  }
}
