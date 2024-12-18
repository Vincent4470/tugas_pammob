import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tugas_pammob/providers/cart_provider.dart';
import 'package:tugas_pammob/screen/checkout_screen.dart';
import 'package:tugas_pammob/models/product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  Widget buildProductImage(Product product) {
    if (product.isLocalImage) {
      return Image.asset(product.imageUrl, fit: BoxFit.cover);
    } else {
      return Image.network(product.imageUrl, fit: BoxFit.cover);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) {
                final cartItem = cart.items.values.toList()[i];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: buildProductImage(cartItem.product),
                    ),
                    title: Text(cartItem.product.name),
                    subtitle: Text(
                      formatter.format(cartItem.product.price * cartItem.quantity),
                    ),
                    trailing: Text('${cartItem.quantity}x'),
                  ),
                );
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    formatter.format(cart.totalAmount),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: cart.items.isEmpty
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CheckoutScreen(),
                          ),
                        );
                      },
                child: const Text('Checkout'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
