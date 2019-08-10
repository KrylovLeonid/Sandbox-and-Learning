import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:common_shop_app/widgets/product_item.dart';
import 'package:common_shop_app/providers/products_provider.dart';

class ProductsGrid extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final products = productsData.items;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, i) {
        return ProductItem(products[i].id, products[i].title,
            products[i].imageUrl);
      },
      itemCount: products.length,
    );
  }
}