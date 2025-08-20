import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/item_controller.dart';
import 'package:flutter_application_1/models/cart_item.dart';
import 'package:flutter_application_1/views/screens/cartScreen.dart';
import 'package:flutter_application_1/views/screens/loginScreen.dart';
import 'package:flutter_application_1/views/screens/mainScreen.dart';
import 'package:flutter_application_1/views/screens/profileScreen.dart';
import 'package:flutter_application_1/views/screens/wishlistScreen.dart';
import 'package:flutter_application_1/views/widgets/details_item.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/login', 
    routes: <RouteBase>[
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage(); 
        },
      ),
      GoRoute(
        path: '/main',
        builder: (BuildContext context, GoRouterState state) {
          return const MainScreen(); 
        },
      ),
       GoRoute(
        path: '/cart',
        builder: (BuildContext context, GoRouterState state) {
          return const CartScreen(); 
        },
      ),
       GoRoute(
        path: '/wishlist',
        builder: (BuildContext context, GoRouterState state) {
          return const WishListScreen(); 
        },
      ),
       GoRoute(
        path: '/profile',
        builder: (BuildContext context, GoRouterState state) {
          return const ProfileScreen(); 
        },
      ),
        GoRoute(
        path: '/item-details/:itemId',
        builder: (BuildContext context, GoRouterState state) {
          final CartItems item = state.extra as CartItems;
          return DetailsItem(item: item);
        },
      ),
    ],
  );
}