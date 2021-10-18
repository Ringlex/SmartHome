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
            SizedBox(height: 20,),
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
    constraints: BoxConstraints(
      maxWidth: 270,
      maxHeight: 60,
    ),
    decoration: BoxDecoration(
        color: Color(0xFF21262D), borderRadius: BorderRadius.circular(15)),
  ));
}
