import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/bottom-nav_controller.dart';
import 'package:flutter_application_1/helpers/themes/app_colors.dart';
import 'package:flutter_application_1/models/cart_item.dart';
import 'package:flutter_application_1/views/widgets/grid_item.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int selectedGrid = 0;
  static final List<CartItems> cartItems = CartItems.cartItems;

  static final List<CartItems> featuredItems = cartItems
      .where((item) => item.isFeatured!)
      .toList();

  static final List<CartItems> newItems = cartItems
      .where((item) => item.isNew!)
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'ShopSmart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.black),
              onPressed: () {
                Provider.of<BottomNavController>(
                  context,
                  listen: false,
                ).setIndex(3);
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _serchBar(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: selectedGrid == 0
                        ? Colors.black
                        : AppColors.secondaryButtonColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        selectedGrid = 0;
                      });
                    },
                    child: Text(
                      "All",
                      style: TextStyle(
                        color: selectedGrid == 0
                            ? Colors.white
                            : AppColors.primaryTextColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: selectedGrid == 1
                        ? Colors.black
                        : AppColors.secondaryButtonColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        selectedGrid = 1;
                      });
                    },
                    child: Text(
                      "Featured",
                      style: TextStyle(
                        color: selectedGrid == 1
                            ? Colors.white
                            : AppColors.primaryTextColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: selectedGrid == 2
                        ? Colors.black
                        : AppColors.secondaryButtonColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        selectedGrid = 2;
                      });
                    },
                    child: Text(
                      "New",
                      style: TextStyle(
                        color: selectedGrid == 2
                            ? Colors.white
                            : AppColors.primaryTextColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _gridView(
              selectedGrid == 0
                  ? cartItems
                  : selectedGrid == 1
                  ? featuredItems
                  : newItems,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _serchBar() {
  return TextField(
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.search, color: Colors.black54),
      hintText: 'Search',
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.black54, width: 1),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    ),
    style: const TextStyle(color: Colors.black),
    cursorColor: Colors.black,
  );
}

Widget _gridView(List<CartItems> items) {
  return Expanded(
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.9,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GridItem(item: items[index]);
      },
    ),
  );
}
