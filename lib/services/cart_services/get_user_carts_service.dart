import '../../helper/api.dart';
import '../../models/cart_model.dart';

class GetUserCartsService {
  static Future<List<CartModel>> getUserCarts(int userId) async {
    List<dynamic> data = await Api.get(
      url: "https://fakestoreapi.com/carts/user/$userId",
    );
    List<CartModel> cartList = [];
    cartList = data.map((e) => CartModel.fromJson(e)).toList();

    return cartList;
  }
}
