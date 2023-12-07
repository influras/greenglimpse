import 'package:flutter/material.dart';
import 'package:greenglimpse/src/controllers/product_controller.dart';
import 'package:greenglimpse/src/controllers/shoppingcart_controller.dart';
import 'package:greenglimpse/src/models/product_model.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProductModel> cartItems = Provider.of<ShoppingCartController>(context).selectedItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          ProductModel product = cartItems[index];

          return ListTile(
            leading: Image.asset(
              product.pictureSource,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            title: Text(product.name),
            subtitle: Text('Price: ${ProductController().toCurrencyFormat(product.price)}'),
            trailing: IconButton(
              icon: const Icon(Icons.remove_shopping_cart),
              onPressed: () {
                // Remove the item from the shopping cart
                  Provider.of<ShoppingCartController>(context, listen: false).removeFromCart(product);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            // Proceed to checkout or any other action
          },
          child: const Text('Proceed to Checkout'),
        ),
      ),
    );
  }
}