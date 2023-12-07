import 'package:flutter/material.dart';
import 'package:greenglimpse/src/controllers/market_controller.dart';
import 'package:greenglimpse/src/controllers/product_controller.dart';
import 'package:greenglimpse/src/controllers/shoppingcart_controller.dart';
import 'package:greenglimpse/src/models/product_model.dart';
import 'package:greenglimpse/src/views/product_view.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

class MarketView extends StatefulWidget {
  const MarketView({Key? key}) : super(key: key);

  @override
  _MarketViewState createState() => _MarketViewState();
}

class _MarketViewState extends State<MarketView> {
  List<ProductModel> products = MarketController().getStubProducts();
  List<ProductModel> filteredProducts = [];
  List<ProductModel> shoppingCart = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                // Filter products based on the search query
                setState(() {
                  filteredProducts = products
                      .where((product) => product.name
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList();
                });
              },
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.75,
              ),
              itemCount: filteredProducts.isEmpty
                  ? products.length
                  : filteredProducts.length,
              itemBuilder: (context, index) {
                ProductModel product = filteredProducts.isEmpty
                    ? products[index]
                    : filteredProducts[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductView(product: product)),
                    );
                  },
                  child: Card(
                    elevation: 2.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(
                          product.pictureSource,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(ProductController()
                              .toCurrencyFormat(product.price)),
                        ),
                        // Use Expanded for the button to take equal space
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Add the product to the shopping cart
                              Provider.of<ShoppingCartController>(context,
                                      listen: false)
                                  .addToCart(product);
                            },
                            child: const Text('add to cart'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
