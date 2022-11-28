import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {
  final String coffeeType;

  CoffeeType({
    required this.coffeeType,
  });

  @override
  Widget build(BuildContext context) {
    return Text(coffeeType);
  }
}
