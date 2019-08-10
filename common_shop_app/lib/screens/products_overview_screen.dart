import 'package:flutter/material.dart';

import 'package:common_shop_app/models/product.dart';
import 'package:common_shop_app/widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  //dummy data

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shop App'),
        ),
        body: new ProductsGrid());
  }
}


