import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/button.dart';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}


class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> _products = [
    Product(name: 'Product 1', price: 10.0),
    Product(name: 'Product 2', price: 20.0),
    Product(name: 'Product 3', price: 30.0),
    Product(name: 'Product 4', price: 40.0),
    Product(name: 'Product 5', price: 50.0),
  ];

  List<Product> _cartItems = [];

  double _totalCartValue = 0.0;

  void _addToCart(Product product) {
    setState(() {
      _cartItems.add(product);
      _totalCartValue += product.price;
    });
  }

  void _checkout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Checkout'),
          content: Column(

            children: <Widget>[
              Text('Total Cart Value: \$$_totalCartValue'),
              SizedBox(height: 8.0),
              Text('Number of Items: ${_cartItems.length}'),
            ],
          ),

          actions: <Widget>[
            MyButton(
              text:'OK',
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: _checkout,
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: _products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          Product product = _products[index];
          bool isInCart = _cartItems.contains(product);
          return GestureDetector(
            onTap: () {
              if (isInCart) {
                setState(() {
                  _cartItems.remove(product);
                  _totalCartValue -= product.price;
                });
              } else {
                _addToCart(product);
              }
            },
            child: Card(
              color: isInCart ? Colors.greenAccent : null,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    '\$${product.price}',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}
