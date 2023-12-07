import 'package:flutter/material.dart';
import 'package:greenglimpse/src/controllers/shoppingcart_controller.dart';
import 'package:greenglimpse/src/models/product_model.dart'; // Import your ProductModel

class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProductModel> cartItems = ShoppingCartController().cartItems;

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
            subtitle: Text('Price: ${ShoppingCartController().toCurrencyFormat(product.price)}'),
            trailing: IconButton(
              icon: const Icon(Icons.remove_shopping_cart),
              onPressed: () {
                // Remove the item from the shopping cart
                ShoppingCartController().removeFromCart(product);
                // Refresh the UI
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ShoppingCartView()),
                );
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
