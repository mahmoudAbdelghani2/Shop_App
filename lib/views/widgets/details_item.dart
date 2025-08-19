import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/item_controller.dart';
import 'package:flutter_application_1/helpers/themes/app_colors.dart';
import 'package:flutter_application_1/models/cart_item.dart';
import 'package:provider/provider.dart';

class DetailsItem extends StatelessWidget {
  final CartItems item;
  const DetailsItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(title: Text(item.name!), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: AppColors.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                item.imageUrl!,
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.name!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '\$${item.price}',
                  style: const TextStyle(fontSize: 16, color: Colors.green),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.description!,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Consumer<ControllerItem>(
                  builder: (context, controller, child) {
                    final bool isAdded = controller.items.any(
                      (cartItem) => cartItem.id == item.id,
                    );

                    return Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (isAdded) {
                            controller.removeItem(item);
                          } else {
                            controller.addItem(item);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isAdded ? Colors.red : Colors.green,
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 20,
                          ),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: Text(
                          isAdded ? 'Remove from Cart' : 'Add to Cart',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
