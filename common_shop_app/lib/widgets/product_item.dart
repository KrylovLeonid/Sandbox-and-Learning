import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:common_shop_app/screens/product_detail_screen.dart';
import 'package:common_shop_app/providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productItem = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
              arguments: productItem.id);
        },
        child: GridTile(
          child: Hero(
            tag: productItem.id,

            child: FadeInImage(
              placeholder: AssetImage('assets/images/product-placeholder.png'),
              image: NetworkImage(productItem.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            leading: Consumer<Product>(
              builder: (ctx, productItem, child) => IconButton(
                  icon: Icon(productItem.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border),
                  onPressed: () {
                    productItem.toggleFavoriteStatus();
                  },
                  color: Theme.of(context).accentColor),
            ),
            backgroundColor: Colors.black87,
            title: Text(
              productItem.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                cart.addItem(
                    productItem.id, productItem.price, productItem.title);
                Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Added item to cart'),
                    action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                        cart.removeSingleItem(productItem.id);
                        Scaffold.of(context).hideCurrentSnackBar();
                      },
                    )));
              },
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
