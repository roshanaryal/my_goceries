import 'package:flutter/material.dart';

enum Categories {
  vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other
}
Categories parseCategory(String value) {
  switch (value) {
    case 'vegetables':
      return Categories.vegetables;
    case 'fruit':
      return Categories.fruit;
    case 'meat':
      return Categories.meat;
    case 'dairy':
      return Categories.dairy;
    case 'carbs':
      return Categories.carbs;
    case 'sweets':
      return Categories.sweets;
    case 'spices':
      return Categories.spices;
    case 'convenience':
      return Categories.convenience;
    case 'hygiene':
      return Categories.hygiene;
    case 'other':
      return Categories.other;
    default:
      throw ArgumentError('Invalid category value: $value');
  }
}

class Category {
  final String title;
  final Color color;

  Category(this.title, this.color);
}
