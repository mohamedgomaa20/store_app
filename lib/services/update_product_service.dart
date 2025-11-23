import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProductService {
  static Future<ProductModel> updateProduct({
    required String id,
    required String title,
    required double price,
    required String description,
    required String image,
    required String category,
  }) async {
    var data = await Api.put(
      url: "https://fakestoreapi.com/products/$id",
      body: {
        "title": title,
        "price": price.toString(),
        "description": description,
        "image": image,
        "category": category,
      },
    );
    return ProductModel.fromJson(data);
  }
}
