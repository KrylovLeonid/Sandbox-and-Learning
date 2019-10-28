import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:common_shop_app/widgets/products_grid.dart';
import 'package:common_shop_app/widgets/badge.dart';
import 'package:common_shop_app/providers/cart.dart';
import 'cart_screen.dart';
import 'package:common_shop_app/widgets/app_drawer.dart';

enum FilterOptions { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {

  static const String routName = "/productsOverviewScreen";
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
        appBar: AppBar(

          actions: <Widget>[
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              onSelected: (FilterOptions selectedOption) {
                switch (selectedOption) {
                  case FilterOptions.All:
                    setState(() {
                      _showOnlyFavorites = false;
                    });
                    break;
                  case FilterOptions.Favorites:
                    setState(() {
                      _showOnlyFavorites = true;
                    });
                    break;
                }
              },
              itemBuilder: (_) => [
                PopupMenuItem(
                    child: Text('Favorites'), value: FilterOptions.Favorites),
                PopupMenuItem(child: Text('All'), value: FilterOptions.All)
              ],
            ),
            Consumer<Cart>(
              builder: (_, cartData, _u) => Badge(
                child: IconButton(
                    icon: Icon(Icons.shopping_cart), onPressed: () {
                      Navigator.of(context).pushNamed(CartScreen.routName);
                }),
                value: cartData.itemCount.toString(),
              ),
            )
          ],
          title: Text('Shop App'),
        ),
        body: new ProductsGrid(_showOnlyFavorites));
  }
}
