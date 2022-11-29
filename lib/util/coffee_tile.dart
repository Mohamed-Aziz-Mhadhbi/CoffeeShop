// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final String coffeImagePath;
  final String coffeName;
  final String coffeDescription;
  final String coffePrice;

  CoffeeTile({
    required this.coffeImagePath,
    required this.coffeName,
    required this.coffeDescription,
    required this.coffePrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 25),
      child: Container(
        padding: EdgeInsets.all(12),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black54,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // coffee image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(coffeImagePath),
            ),

            // coffee name
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffeName,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    coffeDescription,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),

            // price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(coffePrice),
                  Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(Icons.add)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
