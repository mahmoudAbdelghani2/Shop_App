import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/item_controller.dart';
import 'package:flutter_application_1/helpers/themes/app_colors.dart';
import 'package:flutter_application_1/models/cart_item.dart';
import 'package:flutter_application_1/views/widgets/details_item.dart';
import 'package:provider/provider.dart';

class GridItem extends StatefulWidget {
  final CartItems item;
  const GridItem({super.key, required this.item});
  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DetailsItem(item: widget.item)),
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
                    image: AssetImage(widget.item.imageUrl!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(
                    widget.item.isAdded ? Icons.shopping_cart : Icons.add_shopping_cart,
                    color: widget.item.isAdded ? Colors.red : Colors.black,
                  ),
                  onPressed: () {
                    final controller = Provider.of<ControllerItem>(context, listen: false);
                    setState(() {
                      widget.item.isAdded = !widget.item.isAdded;
                      if (widget.item.isAdded) {
                        controller.addItem(widget.item);
                      } else {
                        controller.removeItem(widget.item);
                      }
                    });
                  },
                ),
              ),
            ],
          ),
          Text(
            widget.item.name!,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            '\$${widget.item.price!.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 14, color: AppColors.secondaryTextColor),
          ),
        ],
      ),
    );
  }
}