
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/item_controller.dart';
import 'package:flutter_application_1/helpers/themes/app_colors.dart';
import 'package:flutter_application_1/models/cart_item.dart';
import 'package:flutter_application_1/views/widgets/details_item.dart';
import 'package:provider/provider.dart';

class CardItem extends StatelessWidget {
  final CartItems item;
  const CardItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DetailsItem(item: item)),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                item.imageUrl!,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              item.name!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryTextColor,
              ),
            ),
            subtitle: Text(
              '\$${item.price!.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.secondaryTextColor,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                item.isAdded ? Icons.shopping_cart : Icons.add_shopping_cart,
                color: item.isAdded ? Colors.red : Colors.black,
              ),
              onPressed: () {
                final controller = Provider.of<ControllerItem>(
                  context,
                  listen: false,
                );
                // لو العنصر مضاف: نشيله من الكنترولر ونخلي isAdded false
                // لو مش مضاف: نضيفه ونخلي isAdded true
                if (item.isAdded) {
                  controller.removeItem(item);
                  item.isAdded = false;
                } else {
                  // تجنب إضافات مكررة
                  if (!controller.items.contains(item)) {
                    controller.addItem(item);
                  }
                  item.isAdded = true;
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}