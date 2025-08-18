import 'package:flutter/material.dart';

class CartItems {
  final String id = UniqueKey().toString();
  final String? name;
  final double? price;
  final int? quantity;
  final String? imageUrl;
  final String? description;
  bool isAdded;
  final bool? isFeatured;
  final bool? isNew;

  CartItems({
    this.name,
    this.price,
    this.quantity,
    this.imageUrl,
    this.description,
    required this.isAdded,
    this.isFeatured,
    this.isNew,
  });
  static getItemByID(String id) {
    return cartItems.firstWhere((item) => item.id == id);
  }

  static final List<CartItems> cartItems = [
    CartItems(
      name: 'hoodie1',
      price: 49.99,
      quantity: 1,
      imageUrl: 'assets/images/hoodie1.jpg',
      description:
          'A comfortable and stylish hoodie perfect for casual wear or staying cozy on chilly days. Made with high-quality fabric for durability and warmth.',
      isAdded: false,
      isFeatured: true,
      isNew: false,
    ),
    CartItems(
      name: 'hoodie2',
      price: 54.99,
      quantity: 1,
      imageUrl: 'assets/images/hoodie2.jpg',
      description:
          'Classic hoodie design with a modern twist. Ideal for layering and adding a touch of style to your everyday outfit.',
      isAdded: false,
      isFeatured: false,
      isNew: true,
    ),
    CartItems(
      name: 'hoodie3',
      price: 59.99,
      quantity: 1,
      imageUrl: 'assets/images/hoodie3.jpg',
      description:
          'Premium hoodie featuring soft fabric, perfect for lounging or outdoor activities. Comes in a versatile color that matches any wardrobe.',
      isAdded: false,
      isFeatured: true,
      isNew: true,
    ),
    CartItems(
      name: 'jacket1',
      price: 89.99,
      quantity: 1,
      imageUrl: 'assets/images/jacket1.jpg',
      description:
          'Stylish jacket designed for both comfort and functionality. Great for casual outings or staying warm during the colder months.',
      isAdded: false,
      isFeatured: false,
      isNew: false,
    ),
    CartItems(
      name: 'jacket2',
      price: 94.99,
      quantity: 1,
      imageUrl: 'assets/images/jacket2.jpg',
      description:
          'Modern jacket with a sleek design. Offers excellent insulation while maintaining a fashionable look for daily wear.',
      isAdded: false,
      isFeatured: true,
      isNew: false,
    ),
    CartItems(
      name: 'jacket3',
      price: 99.99,
      quantity: 1,
      imageUrl: 'assets/images/jacket3.jpg',
      description:
          'Durable jacket made for everyday adventures. Combines style and practicality with high-quality materials.',
      isAdded: false,
      isFeatured: false,
      isNew: true,
    ),
    CartItems(
      name: 'pants1',
      price: 39.99,
      quantity: 1,
      imageUrl: 'assets/images/pants1.jpg',
      description:
          'Comfortable pants suitable for casual wear or semi-formal occasions. Made with soft fabric for a relaxed fit.',
      isAdded: false,
      isFeatured: true,
      isNew: false,
    ),
    CartItems(
      name: 'pants2',
      price: 42.99,
      quantity: 1,
      imageUrl: 'assets/images/pants2.jpg',
      description:
          'Stylish pants designed to offer both comfort and elegance. Perfect for work or casual outings.',
      isAdded: false,
      isFeatured: false,
      isNew: true,
    ),
    CartItems(
      name: 'pants3',
      price: 45.99,
      quantity: 1,
      imageUrl: 'assets/images/pants3.jpg',
      description:
          'Premium pants crafted with attention to detail. Ideal for everyday wear and versatile enough for different occasions.',
      isAdded: false,
      isFeatured: true,
      isNew: true,
    ),
    CartItems(
      name: 'shoes1',
      price: 69.99,
      quantity: 1,
      imageUrl: 'assets/images/shoes1.jpg',
      description:
          'Comfortable and trendy shoes that are perfect for daily wear. Offers excellent support and durability.',
      isAdded: false,
      isFeatured: false,
      isNew: false,
    ),
    CartItems(
      name: 'shoes2',
      price: 74.99,
      quantity: 1,
      imageUrl: 'assets/images/shoes2.jpg',
      description:
          'Stylish shoes designed for fashion-conscious individuals. Perfect for pairing with casual or smart outfits.',
      isAdded: false,
      isFeatured: true,
      isNew: true,
    ),
    CartItems(
      name: 'shoes3',
      price: 79.99,
      quantity: 1,
      imageUrl: 'assets/images/shoes3.png',
      description:
          'High-quality shoes that combine comfort and style. Durable enough for daily activities while keeping a sleek look.',
      isAdded: false,
      isFeatured: false,
      isNew: true,
    ),
    CartItems(
      name: 'T_Shirt1',
      price: 24.99,
      quantity: 1,
      imageUrl: 'assets/images/T_Shirt1.JPG',
      description:
          'Casual T-shirt made from soft, breathable fabric. Perfect for everyday wear and easy to pair with jeans or shorts.',
      isAdded: false,
      isFeatured: true,
      isNew: false,
    ),
    CartItems(
      name: 'T_Shirt2',
      price: 27.99,
      quantity: 1,
      imageUrl: 'assets/images/T_Shirt2.png',
      description:
          'Classic T-shirt with a modern fit. Comfortable and versatile, suitable for casual outings or lounging at home.',
      isAdded: false,
      isFeatured: false,
      isNew: true,
    ),
  ];
}
