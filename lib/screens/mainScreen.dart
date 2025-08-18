import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/cartScreen.dart';
import 'package:flutter_application_1/screens/homeScreen.dart';
import 'package:flutter_application_1/screens/profileScreen.dart';
import 'package:flutter_application_1/screens/shopScreen.dart';
import 'package:flutter_application_1/screens/wishlistScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = const[
    HomeScreen(), 
    ShopScreen(),
    WishListScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  final List<String> _titles = [
    'Home',
    'Shop',
    'Wishlist',
    'Cart',
    'Profile',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}