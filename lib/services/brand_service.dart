import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:mobile/constant.dart';
import 'package:mobile/models/api_response.dart';
import 'package:mobile/models/brands.dart';
import 'package:mobile/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BrandService {
  Future<List<Brand>?> getBrands() async {
    var client = http.Client();
    var uri = Uri.parse(brandsURL);
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return brandFromJson(json);
    }
    return null;
  }
}

/*Future<List<Brand>?> getBrands() async {
  final response = await http.get(Uri.parse(brandsURL));

  var responseData = json.decode(response.body);

  //Creating a list to store input data;
  List<Brand> brands = [];
  for (var singleBrand in responseData) {
    Brand brand = Brand(
        id: singleBrand["id"],
        title: singleBrand["title"],
        slug: singleBrand["slug"],
        logo: singleBrand["logo"],
        status: singleBrand["status"]);

    //Adding user to the list.
    brands.add(brand);
  }
  return brands;
}
*/
