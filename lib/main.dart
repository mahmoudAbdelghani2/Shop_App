import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/bottom-nav_controller.dart';
import 'package:flutter_application_1/views/screens/loginScreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/controllers/item_controller.dart';

void main() {
   runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ControllerItem()),
        ChangeNotifierProvider(create: (_) => BottomNavController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}