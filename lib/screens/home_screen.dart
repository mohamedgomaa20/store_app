import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:store_app/screens/my_cart_screen.dart';
import 'package:store_app/widgets/build_error_widget.dart';
import 'package:store_app/widgets/home_search_bar.dart';
import 'package:store_app/widgets/products_grid.dart';

import '../providers/product_provider.dart';
import '../widgets/categories_widget.dart';
import '../widgets/no_product_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Gap(20),
            Padding(
              padding: .only(left: 15.0),
              child: Align(
                alignment: .centerLeft,
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      'Discover',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 32,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyCartScreen(),
                          ),
                        );
                      },
                      icon: Icon(CupertinoIcons.cart),
                    ),
                  ],
                ),
              ),
            ),
            Gap(16),
            HomeSearchBar(),
            Gap(16),
            CategoriesWidget(),
            Gap(5),
            Consumer<ProductProvider>(
              builder: (context, provider, child) {
                if (provider.error != null) {
                  return BuildErrorWidget(errorMessage: provider.error!);
                }
                if (provider.allProducts.isEmpty) {
                  NoProductWidget();
                }
                return Expanded(
                  child: ProductsGrid(
                    products: provider.selectedCategory == "all"
                        ? provider.allProducts
                        : provider.filteredProducts,
                    isLoading: provider.isLoading,
                  ),
                );
              },
            ),
            Gap(20),
          ],
        ),
      ),
    );
  }
}
