import 'package:store_app/helper/api.dart';
import 'package:store_app/models/cart_model.dart';

class UpdateCartService {
  static Future<CartModel> updateCart({
    required int cartId,
    required int userId,
    required List<CartProduct> products,
  }) async {
    var data = await Api.put(
      url: "https://fakestoreapi.com/carts/$cartId",
      body: {
        "userId": userId,
        "products": products.map((e) => e.toJson()).toList(),
      },
    );
    CartModel cartModel = CartModel.fromJson(data);
    return cartModel;
  }
}
