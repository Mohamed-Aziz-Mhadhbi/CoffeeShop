import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {
  final String coffeeType;

  CoffeeType({
    required this.coffeeType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Text(
        coffeeType,
        // ignore: prefer_const_constructors
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.orange,
        ),
      ),
    );
  }
}
