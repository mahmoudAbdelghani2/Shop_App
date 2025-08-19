import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/bottom-nav_controller.dart';
import 'package:flutter_application_1/views/screens/cartScreen.dart';
import 'package:flutter_application_1/views/screens/homeScreen.dart';
import 'package:flutter_application_1/views/screens/profileScreen.dart';
import 'package:flutter_application_1/views/screens/shopScreen.dart';
import 'package:flutter_application_1/views/screens/wishlistScreen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    ShopScreen(),
    WishListScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final bottomNavController = Provider.of<BottomNavController>(context);
    return Scaffold(
      body: _screens[bottomNavController.index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        iconSize: 30,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        backgroundColor: Colors.white,
        currentIndex: bottomNavController.index,
        onTap: (i) => bottomNavController.setIndex(i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
