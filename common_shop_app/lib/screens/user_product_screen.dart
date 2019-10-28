import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:common_shop_app/providers/products_provider.dart';
import 'package:common_shop_app/widgets/user_product.dart';
import 'package:common_shop_app/widgets/app_drawer.dart';
import 'package:common_shop_app/screens/all_screens_import.dart';

class UserProductsScreen extends StatelessWidget {

  static const routName ='/user_products';
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routName);
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: productsData.items.length,
            itemBuilder: (_, i) => UserProductItem(productsData.items[i].title, productsData.items[i].imageUrl)),
      ),
    );
  }
}
