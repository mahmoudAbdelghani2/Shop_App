import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/item_controller.dart';
import 'package:flutter_application_1/helpers/themes/app_colors.dart';
import 'package:flutter_application_1/models/cart_item.dart';
import 'package:flutter_application_1/views/widgets/details_item.dart';
import 'package:provider/provider.dart';

class CardItem extends StatefulWidget {
  final CartItems item;
  const CardItem({super.key, required this.item});

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsItem(item: widget.item),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              widget.item.imageUrl!,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            widget.item.name!,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryTextColor,
            ),
          ),
          subtitle: Text(
            '\$${widget.item.price!.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 14, color: AppColors.secondaryTextColor),
          ),
          trailing: Consumer<ControllerItem>(
            builder: (context, controller, _) {
              final qty = controller.getQuantity(widget.item);
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      controller.incrementItem(widget.item);
                    },
                    icon: Icon(Icons.add),
                  ),
                  Text('$qty'),
                  IconButton(
                    onPressed: () {
                      controller.decrementItem(widget.item);
                    },
                    icon: Icon(Icons.remove),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
