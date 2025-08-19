import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/widgets/card_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/controllers/item_controller.dart';
import 'package:flutter_application_1/helpers/themes/app_colors.dart';
import 'package:flutter_application_1/models/cart_item.dart';
import 'package:lottie/lottie.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ControllerItem>(context);
    final List<CartItems> items = controller.items;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        actions: [
          if (items.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_forever, color: Colors.black),
              onPressed: () {
                controller.clearItems();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Cart cleared!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: items.isEmpty
            ? Center(
                child: Column(
                  children: [
                    Lottie.asset(
                      'assets/lottie/NoDataFound.json',
                      width: 400,
                      height: 400,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Your cart is empty! \nGo and add some items!',
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: CardItem(item: item),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 10),
                  Consumer<ControllerItem>(
                    builder: (context, controller, child) {
                      return ListTile(
                        contentPadding: const EdgeInsets.all(16.0),
                        title: Text(
                          "Subtotal: \$${controller.subtotal.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "Taxes: \$${controller.totalTax.toStringAsFixed(2)}",
                          style: const TextStyle(fontSize: 13),
                        ),
                        trailing: Text(
                          "\$${controller.total.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.clearItems();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Checkout successful!'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Proceed to Checkout',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
      ),
    );
  }
}
