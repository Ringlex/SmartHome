import 'package:flutter/material.dart';

class CoffeExpress extends StatefulWidget {
  @override
  _CoffeExpressState createState() => _CoffeExpressState();
}

class _CoffeExpressState extends State<CoffeExpress> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxHeight: 400, maxWidth: 400),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  typeCoffee(),
                  SizedBox(
                    width: 30,
                  ),
                  countGrain(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  coffeeMl(),
                  SizedBox(
                    width: 30,
                  ),
                  typeCleaning(),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            makeDrink(),
          ],
        ),
      ),
    );
  }
}

//TODO Add to buttons parameters: icons, functions

Widget typeCoffee() {
  /// Button which select kind of coffee
  return GestureDetector(
      child: Container(
    padding: EdgeInsets.all(30),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.local_cafe, color: Color(0xFF58A6FF), size: 30),
          SizedBox(
            height: 5,
          ),
          Text('Coffee', style: TextStyle(fontSize: 20, color: Colors.white)),
        ],
      ),
    ),
    constraints: BoxConstraints(
      maxWidth: 120,
      maxHeight: 120,
    ),
    decoration: BoxDecoration(
        color: Color(0xFF21262D), borderRadius: BorderRadius.circular(15)),
  ));
}

Widget countGrain() {
  return GestureDetector(
      child: Container(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.grain, color: Color(0xFF58A6FF), size: 30),
          SizedBox(
            height: 5,
          ),
          Text('+3', style: TextStyle(fontSize: 20, color: Colors.white)),
        ],
      ),
    ),
    constraints: BoxConstraints(
      maxWidth: 120,
      maxHeight: 120,
    ),
    decoration: BoxDecoration(
        color: Color(0xFF21262D), borderRadius: BorderRadius.circular(15)),
  ));
}

Widget typeCleaning() {
  return GestureDetector(
      child: Container(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Cleaning\n mode',
          textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.white)),
        ],
      ),
    ),
    constraints: BoxConstraints(
      maxWidth: 120,
      maxHeight: 120,
    ),
    decoration: BoxDecoration(
        color: Color(0xFF21262D), borderRadius: BorderRadius.circular(15)),
  ));
}

Widget coffeeMl() {
  return GestureDetector(
      child: Container(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('+100 ml', style: TextStyle(fontSize: 20, color: Colors.white)),
        ],
      ),
    ),
    constraints: BoxConstraints(
      maxWidth: 120,
      maxHeight: 120,
    ),
    decoration: BoxDecoration(
        color: Color(0xFF21262D), borderRadius: BorderRadius.circular(15)),
  ));
}

Widget makeDrink() {
  return GestureDetector(
      child: Container(
    padding: EdgeInsets.only(top: 10, bottom: 10, left: 50, right: 50),
    child: Text('Make drink!',
        style: TextStyle(color: Colors.white, fontSize: 26)),
    constraints: BoxConstraints(
      maxWidth: 270,
      maxHeight: 60,
    ),
    decoration: BoxDecoration(
        color: Colors.green, borderRadius: BorderRadius.circular(15)),
  ));
}
