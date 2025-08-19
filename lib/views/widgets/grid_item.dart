import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/item_controller.dart';
import 'package:flutter_application_1/helpers/themes/app_colors.dart';
import 'package:flutter_application_1/models/cart_item.dart';
import 'package:flutter_application_1/views/widgets/details_item.dart';
import 'package:provider/provider.dart';

class GridItem extends StatelessWidget {
  final CartItems item;
  const GridItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsItem(item: item),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(item.imageUrl!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Consumer<ControllerItem>(
                  builder: (context, controller, _) {
                    final bool isAdded =
                        controller.items.any((cartItem) => cartItem.id == item.id);

                    return IconButton(
                      icon: Icon(
                        isAdded ? Icons.shopping_cart : Icons.add_shopping_cart,
                        color: isAdded ? Colors.red : Colors.black,
                      ),
                      onPressed: () {
                        if (isAdded) {
                          controller.removeItem(item);
                        } else {
                          controller.addItem(item);
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          Text(
            item.name!,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            '\$${item.price!.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 14, color: AppColors.secondaryTextColor),
          ),
        ],
      ),
    );
  }
}