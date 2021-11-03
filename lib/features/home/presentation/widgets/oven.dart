import 'package:flutter/material.dart';

class Oven extends StatefulWidget {
  @override
  _OvenState createState() => _OvenState();
}

class _OvenState extends State<Oven> {
  double valueTemperature = 55;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            functionButton(
                Icon(Icons.settings_overscan,
                    size: 50, color: Color(0xFF58A6FF)),
                () {}), //TODO add functionality for baking mode
            SizedBox(
              width: 20,
            ),
            functionButton(
                Icon(Icons.play_arrow, size: 50, color: Color(0xFF58A6FF)),
                () {}),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            functionButton(
                Icon(Icons.toys, size: 50, color: Color(0xFF58A6FF)), () {}),
            SizedBox(
              width: 20,
            ),
            functionButton(
                Icon(Icons.bakery_dining, size: 50, color: Color(0xFF58A6FF)),
                () {}),
          ],
        ),
        SizedBox(
          height: 30,
        ),
      Text('Temperature', style: TextStyle(color: Colors.white, fontSize: 26)),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Slider(
            activeColor: Color(0xFFF9826C),
            inactiveColor: Color(0x80F9826C),
            value: valueTemperature,
            onChanged: (double value) {
              setState(() {
                valueTemperature = value.roundToDouble();
              });
            },
            min: 0,
            max: 250,
            divisions: 25,
            label: valueTemperature.toInt().toString(),
          ),
        ),
      ]),
    );
  }
}

/// Widget [functionButton] allow add a icon of button 
/// and function. Applies to only [Oven].
Widget functionButton(Icon icon, Function func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      child: Center(
        child: icon,
      ),
      height: 110,
      width: 110,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF21262D),
      ),
    ),
  );
}
