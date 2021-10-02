import 'package:flutter/material.dart';

class LightBulb extends StatefulWidget {
  @override
  _LightBulbState createState() => _LightBulbState();
}

class _LightBulbState extends State<LightBulb> {
  double valueBright = 20;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 60),
              child: Text(
                'Brightness',
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Slider(
                activeColor: Color(0xFFF9826C),
                inactiveColor: Color(0x80F9826C),
                value: valueBright,
                onChanged: (double value) {
                  setState(() {
                    valueBright = value.roundToDouble();
                  });
                },
                min: 0,
                max: 100,
                divisions: 20,
                label: valueBright.toInt().toString(),
              ),
            ),
          ],
        );
      },
    );
  }
}
