import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/add_product_service.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/category_item.dart';
import 'package:store_app/widgets/product_card.dart';
import 'package:store_app/widgets/products_grid.dart';

import '../widgets/categories_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  // FaIcon(FontAwesomeIcons.gamepad),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Gap(100),
          CategoriesWidget(),
          Gap(5),
          Expanded(child: ProductsGrid()),
          Gap(20),
        ],
      ),
    );
  }

}
