import 'package:flutter/material.dart';
import 'package:store_app/widgets/custom_app_bar.dart';

import '../models/product_model.dart';
import '../widgets/cart_item.dart';
import '../widgets/checkout_summary_box.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  List<ProductModel> _getDummyData() {
    return List.generate(
      10,
      (index) => ProductModel(
        id: 1,
        title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
        price: 109.058,
        description: "",
        category: "men's clothing",
        image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png",

        rating: RatingModel(rate: 3.9, count: 120),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var displayProducts = _getDummyData();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: "My Cart"),
            Expanded(
              child: ListView.builder(
                itemCount: displayProducts.length,
                itemBuilder: (context, index) {
                  return CartItemWidget(
                    productModel: displayProducts[index],
                    initialQuantity: 1,
                    onRemove: () {},
                  );
                },
              ),
            ),
            CheckoutSummaryBox(
              subTotal: 5870,
              vat: 0,
              shippingFee: 80,
              total: 5980,
              onCheckout: () {},
            ),
          ],
        ),
      ),
    );
  }
}
