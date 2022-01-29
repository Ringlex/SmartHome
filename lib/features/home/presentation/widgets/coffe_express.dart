// @dart=2.9
import 'package:flutter/material.dart';
import 'package:home_app/features/home/domain/entities/tool.dart';
import 'package:home_app/features/home/presentation/widgets/oven.dart';
import 'package:home_app/features/home/presentation/widgets/pop_up_button.dart';

class CoffeExpress extends StatefulWidget {
  final String path;
  final String pathTools;
  final List<Tool> tool;
  final int toolIndex;

  const CoffeExpress({
    Key key,
    this.path,
    this.pathTools,
    this.tool,
    this.toolIndex,
  }) : super(key: key);

  @override
  _CoffeExpressState createState() => _CoffeExpressState();
}

class _CoffeExpressState extends State<CoffeExpress> {
  
  List<ItemMode> milliliters = [
    ItemMode(
      title: '100',
    ),
    ItemMode(
      title: '150',
    ),
    ItemMode(
      title: '200',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    List<ItemMode> coffeeList = [
    ItemMode(
      title: 'Dark Coffe',
    ),
    ItemMode(
      title: 'Latte',
    ),
    ItemMode(
      title: 'Capuccino',
    ),
    ItemMode(
      title: 'Espresso',
    ),
    ItemMode(
      title: 'Coffe&Milk',
    ),
  ];
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
                  PopUpButton(
                    path: widget.path,
                    kindOfMode: widget.tool[widget.toolIndex].coffeMode,
                    heatPosition: coffeeList,
                    variable: 'coffeMode',
                    pathTools: widget.pathTools,
                    toolIndex: widget.toolIndex,
                    tool: widget.tool,
                    child: typeCoffee(),
                    //TODO type of coffe doesn't changed in grid
                  ),
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
