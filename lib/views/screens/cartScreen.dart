import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/widgets/card_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/controllers/item_controller.dart';
import 'package:flutter_application_1/helpers/themes/app_colors.dart';
import 'package:flutter_application_1/models/cart_item.dart';

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
              },
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: items.isEmpty
            ? const Center(
                child: Text(
                  'Your cart is empty',
                  style: TextStyle(fontSize: 24),
                ),
              )
            : ListView.separated(
                itemCount: items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Dismissible(
                    key: ValueKey(item.id),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.red,
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (_) {
                      controller.removeItem(item);
                    },
                    child: CardItem(item: item),
                  );
                },
              ),
      ),
    );
  }
}
