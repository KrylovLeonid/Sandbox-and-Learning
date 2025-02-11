import 'package:flutter/material.dart';
import 'package:common_shop_app/providers/product.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

class ProductsProvider with ChangeNotifier {
   List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

   final token;

   ProductsProvider(this.token);

  Future<void> addProduct(Product product) {
    const url = 'https://fluttertestbase.firebaseio.com/products.json';
     return http
        .post(url,
            body: json.encode({
              'title': product.title,
              'description': product.description,
              'imageURL': product.imageUrl,
              'price': product.price,
              'isFaavorie': product.isFavorite
            }))
        .then((response) {
      final newProduct = Product(
          title: product.title,
          imageUrl: product.imageUrl,
          price: product.price,
          description: product.description,
          id: json.decode(response.body)['name']);

      _items.add(newProduct);
      notifyListeners();

    });

  }

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((item) => item.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((item) => item.id == id);
  }

  Future<void> fetchProducts(){

    const url = 'https://fluttertestbase.firebaseio.com/products.json';
    http.get(url).then((response){
      var fetchedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedProducts = [];
      fetchedData.forEach((prodId, value){
        loadedProducts.add(Product(
          id: prodId,
          title: value['title'],
          description: value['description'],
          price: value['value'],
          isFavorite: value['isFavorite'],
          imageUrl: value['ImageUrl']

        ));
      });
      _items = loadedProducts;
      notifyListeners();
    });
  }
}
