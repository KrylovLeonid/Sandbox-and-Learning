import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:common_shop_app/providers/product.dart';
import 'package:common_shop_app/providers/products_provider.dart';

class EditProductScreen extends StatefulWidget {
  static const routName = '/edit-product';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();

  var _isInit = false;

  Product _editedProduct =
      Product(id: null, title: '', price: 0, description: '', imageUrl: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Editing'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Form(
        key: _form,
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Title'),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value.isEmpty) return 'Please enter value';
                return null;
              },
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_priceFocusNode);
              },
              onSaved: (value) {
                _editedProduct = Product(
                    title: value,
                    price: _editedProduct.price,
                    description: _editedProduct.description,
                    id: _editedProduct.id,
                    imageUrl: _editedProduct.imageUrl);
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Price'),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              focusNode: _priceFocusNode,
              validator: (value) {
                if (value.isEmpty) return 'Please enter value';
                return null;
              },
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_descriptionFocusNode);
              },
              onSaved: (value) {
                _editedProduct = Product(
                    title: _editedProduct.title,
                    price: double.parse(value),
                    description: _editedProduct.description,
                    id: _editedProduct.id,
                    imageUrl: _editedProduct.imageUrl);
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 3,
              validator: (value) {
                if (value.isEmpty) return 'Please enter value';
                return null;
              },
              focusNode: _descriptionFocusNode,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.next,
              onSaved: (value) {
                _editedProduct = Product(
                    title: _editedProduct.title,
                    price: _editedProduct.price,
                    description: value,
                    id: _editedProduct.id,
                    imageUrl: _editedProduct.imageUrl);
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1)),
                  child: _imageUrlController.text.isEmpty
                      ? Text('Enter URL')
                      : FittedBox(
                          child: Image.network(_imageUrlController.text),
                          fit: BoxFit.cover,
                        ),
                ),
                Expanded(
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) return 'Please enter value';
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Image URL'),
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.done,
                    controller: _imageUrlController,
                    focusNode: _imageUrlFocusNode,
                    onFieldSubmitted: (_) => _saveForm(),
                    onSaved: (value) {
                      _editedProduct = Product(
                          title: _editedProduct.title,
                          price: _editedProduct.price,
                          description: _editedProduct.description,
                          id: _editedProduct.id,
                          imageUrl: value);
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) return;
    _form.currentState.save();
    Provider.of<ProductsProvider>(context, listen: false)
        .addProduct(_editedProduct);
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if(_isInit){
      Provider.of<ProductsProvider>(context).fetchProducts();

    }
    _isInit = true;
    super.didChangeDependencies();
  }
}
