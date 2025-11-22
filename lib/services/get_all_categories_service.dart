import 'dart:convert';

import 'package:http/http.dart' as http;

class GetAllCategoriesService {
  static Future<List<String>> getAllCategories() async {
    final url = "https://fakestoreapi.com/products/categories";

    http.Response response = await http.get(Uri.parse(url));
    List<String> categoriesList = [];
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      categoriesList = data.map((e) => e.toString()).toList();
    }
    return categoriesList;
  }
}
