import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/themes/app_colors.dart';
import 'package:flutter_application_1/views/screens/mainScreen.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 350,
                height: 350,
                color: AppColors.backgroundColor,
                child: Image.asset('assets/images/logo.jpeg', fit: BoxFit.cover),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: AppColors.secondaryTextColor),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.black54, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.black, width: 1.2),
                  ),
                ),
                style: TextStyle(color: AppColors.primaryTextColor),
                cursorColor: Colors.black,
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: AppColors.secondaryTextColor),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.black54, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.black, width: 1.2),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                ),
                style: TextStyle(color: AppColors.primaryTextColor),
                cursorColor: Colors.black,
              ),
          
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonColor,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  context.go('/main');
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: AppColors.secondaryTextColor),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: AppColors.secondaryTextColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
