import '../helper/api.dart';

class GetAllCategoriesService {
  static Future<List<String>> getAllCategories() async {
    List<dynamic> data = await Api.get(
      url: "https://fakestoreapi.com/products/categories",
    );
    List<String> categoriesList = [];
    categoriesList = data.map((e) => e.toString()).toList();
    return categoriesList;
  }
}
