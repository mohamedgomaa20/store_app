import 'package:store_app/helper/api.dart';
import 'package:store_app/models/cart_model.dart';

class GetCartByIdService {
  static Future<CartModel> getCartById(int id) async {
    var data = await Api.get(url: "https://fakestoreapi.com/carts/$id");
    CartModel cartModel = CartModel.fromJson(data);

    return cartModel;
  }
}
