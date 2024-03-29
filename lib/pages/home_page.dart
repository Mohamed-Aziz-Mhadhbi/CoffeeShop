// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffeui/util/coffee_tile.dart';
import 'package:coffeui/util/coffee_types.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List latte = [
    // [ coffeImagePath, coffeName, coffeDescription, coffePrice ]
    [
      'lib/images/latte-with-coffee-beans-table.jpg',
      'Latte Beans',
      'With Coffee Beans',
      '2.5 DT'
    ],
    [
      'lib/images/latte-coffee-beans-side-view.jpg',
      'Latte Almond',
      'With Almond Milk',
      '3 DT'
    ],
    [
      'lib/images/coffee-milk-latte-with-strawberry-slices.jpg',
      'Latte Strawberry',
      'With strawberry slices',
      '4 DT'
    ],
  ];

  final List espresso = [
    [
      'lib/images/person-serving-cup-coffee-with-metal-jug.jpg',
      'espresso',
      'espresso coffee',
      '2 DT'
    ],
  ];

  final List cappucino = [
    [
      'lib/images/photo-1572442388796-11668a67e53d.jpg',
      'cappucino',
      'cappucino coffee',
      '3 DT',
    ],
  ];

  final List black = [
    [
      'lib/images/morning-with-turkish-coffee-brewing.jpg',
      'Turkish',
      'Turkish Coffee',
      '3 DT'
    ],
  ];

// overall coffe summary
  late List coffeeTileList = latte;
// list of coffe types
  final List coffeeType = [
    // [coffee type, isSelected]
    [
      'Latte',
      true,
    ],
    [
      'Espresso',
      false,
    ],
    [
      'Cappucino',
      false,
    ],
    [
      'Black',
      false,
    ],
  ];

// user tapped on coffe types
  void coffeeTypesSelected(int index) {
    setState(() {
      //this for loop makes every selection flase
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
      ),
      body: Column(
        children: [
          //Find the best coffe for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find the best coffee for you",
              style: TextStyle(fontSize: 36),
            ),
          ),

          SizedBox(
            height: 25,
          ),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Find your coffee...",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 25,
          ),

          // Horizantal listview of coffee
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: ((context, index) {
                return CoffeeType(
                  coffeeType: coffeeType[index][0],
                  isSelected: coffeeType[index][1],
                  onTap: () {
                    coffeeTypesSelected(index);
                    if (coffeeType[index][1] &&
                        coffeeType[index][0] == "Latte") {
                      coffeeTileList = latte;
                    } else if (coffeeType[index][1] &&
                        coffeeType[index][0] == "Espresso") {
                      coffeeTileList = espresso;
                    } else if (coffeeType[index][1] &&
                        coffeeType[index][0] == "Cappucino") {
                      coffeeTileList = cappucino;
                    } else if (coffeeType[index][1] &&
                        coffeeType[index][0] == "Black") {
                      coffeeTileList = black;
                    }
                  },
                );
              }),
            ),
          ),

          // Horizantal listview of coffee tiles
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeTileList.length,
              itemBuilder: ((context, index) {
                return CoffeeTile(
                  coffeImagePath: coffeeTileList[index][0],
                  coffeName: coffeeTileList[index][1],
                  coffeDescription: coffeeTileList[index][2],
                  coffePrice: coffeeTileList[index][3],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
