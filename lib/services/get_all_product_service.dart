import 'package:store_app/helper/api.dart';

import '../models/product_model.dart';

class GetAllProductsService {
  static Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data = await Api.get(
      url: "https://fakestoreapi.com/products",
    );
    List<ProductModel> productsList = [];
    productsList = data.map((e) => ProductModel.fromJson(e)).toList();
    return productsList;
  }
}
