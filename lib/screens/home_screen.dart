import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:store_app/screens/my_cart_screen.dart';
import 'package:store_app/services/cart_services/get_all_cart_service.dart';
import 'package:store_app/utils/app_colors.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GetAllCartService.getAllCart();
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Gap(20),
            HomeHeader(),
            Gap(16),
            HomeSearchBar(),
            Gap(16),
            CategoriesWidget(),
            Gap(5),
            ProductsSection(),
          ],
        ),
      ),
    );
  }
}

class ProductsSection extends StatelessWidget {
  const ProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, provider, child) {
        if (provider.error != null) {
          return BuildErrorWidget(errorMessage: provider.error!);
        }
        if (provider.allProducts.isEmpty) {
          NoProductWidget();
        }
        final products = provider.selectedCategory == "all"
            ? provider.allProducts
            : provider.filteredProducts;

        return Expanded(
          child: ProductsGrid(
            products: products,
            isLoading: provider.isLoading,
          ),
        );
      },
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .only(left: 15.0),
      child: Align(
        alignment: .centerLeft,
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              'Discover',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 32),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyCartScreen()),
                );
              },
              icon: Icon(CupertinoIcons.cart),
            ),
          ],
        ),
      ),
    );
  }
}
