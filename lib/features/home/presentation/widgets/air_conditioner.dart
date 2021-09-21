import 'package:flutter/material.dart';

class AirConditioner extends StatefulWidget {
  @override
  _AirConditionerState createState() => _AirConditionerState();
}

class _AirConditionerState extends State<AirConditioner> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Temperature(),
        Modes(),
      ],
    );
  }
}

class Temperature extends StatefulWidget {
  @override
  _TemperatureState createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Row(children: [
        buttonControl(Icon(
          Icons.remove,
          color: Color(0xFFF9826C),
          size: 30,
        )),
        Expanded(
          child: Container(
            child: Center(
              child: Container(
                child: Center(
                  child: Text(
                    '25',
                    style: TextStyle(
                      color: Color(0xFF0D1117),
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white60,
                ),
              ),
            ),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF161B22),
            ),
          ),
        ),
        buttonControl(Icon(
          Icons.add,
          color: Color(0xFFF9826C),
          size: 30,
        )),
      ]),
    );
  }
}

Widget buttonControl(Icon icon) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 50,
      width: 50,
      child: icon,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF161B22),
      ),
    ),
  );
}

class Modes extends StatefulWidget {
  @override
  _ModesState createState() => _ModesState();
}

class _ModesState extends State<Modes> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 40.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          mode(
            Icon(
              Icons.toys,
              size: 30,
              color: Colors.white,
            ),
            () {},
            'Air mode',
          ),
          SizedBox(
            width: 32,
          ),
          mode(
            Icon(
              Icons.repeat,
              size: 35,
              color: Colors.white,
            ),
            () {},
            'Air mode',
          ),
          SizedBox(
            width: 32,
          ),
          mode(
            Icon(
              Icons.watch_later,
              size: 30,
              color: Colors.white,
            ),
            () {},
            'Timer',
          ),
        ],
      ),
    );
  }
}

Widget mode(Icon icon, Function function, String title) {
  return GestureDetector(
    onTap: function,
    child: Container(
      height: 120,
      width: 100,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              height: 15,
            ),
            Text(
              title,
              style: TextStyle(color: Color(0xFF58A6FF)),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: Color(0xFF161B22),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
