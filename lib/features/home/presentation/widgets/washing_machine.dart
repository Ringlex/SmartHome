import 'package:flutter/material.dart';
import 'package:home_app/features/home/presentation/widgets/air_conditioner.dart';

class WashingMachine extends StatefulWidget {
  @override
  _WashingMachineState createState() => _WashingMachineState();
}

class _WashingMachineState extends State<WashingMachine> {
  bool stateMachine = false;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                selectButton(Icon(Icons.mode_edit, color: Colors.white),
                    'Wash mode', () {}),
                selectButton(Icon(Icons.mode_edit, color: Colors.white),
                    'Work mode', () {}),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      stateMachine = !stateMachine;
                    });
                  },
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    switchInCurve: Curves.easeInBack,
                    transitionBuilder: (child, animation) =>
                        ScaleTransition(scale: animation, child: child),
                    child: stateMachine
                        ? onOfButton(stateMachine)
                        : onOfButton(stateMachine),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Temperature',
              style: TextStyle(color: Colors.white, fontSize: 26),
            ),
            SizedBox(
              height: 20,
            ),
            WashTemerature(),
            SizedBox(
              height: 30,
            ),
            Text(
              'Speed engine',
              style: TextStyle(color: Colors.white, fontSize: 26),
            ),
            SizedBox(
              height: 20,
            ),
            EngineSpeed(),
          ],
        );
      },
    );
  }
}

Widget selectButton(Icon icon, String title, Function func) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(color: Color(0xFF58A6FF), fontSize: 20),
        ),
      ],
    ),
    height: 120,
    width: 120,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Color(0xFF161B22),
    ),
  );
}

Widget onOfButton(bool state) {
  return Container(
    child: state
        ? Icon(
            Icons.pause,
            color: Colors.white,
            size: 40,
          )
        : Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 40,
          ),
    key: state ? ValueKey('true') : ValueKey('false'),
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: state ? Colors.red : Colors.green,
      borderRadius: BorderRadius.circular(15),
    ),
  );
}

class WashTemerature extends StatefulWidget {
  @override
  _WashTemeratureState createState() => _WashTemeratureState();
}

class _WashTemeratureState extends State<WashTemerature> {
  int status = 1;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                status = 1;
              });
            },
            child: tempButton(
              status,
              '30',
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                status = 2;
              });
            },
            child: tempButton(
              status,
              '40',
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                status = 3;
              });
            },
            child: tempButton(
              status,
              '50',
            ),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                status = 4;
              });
            },
            child: tempButton(
              status,
              '60',
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                status = 5;
              });
            },
            child: tempButton(
              status,
              '80',
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                status = 6;
              });
            },
            child: tempButton(
              status,
              '90',
            ),
          ),
        ],
      ),
    ]);
  }
}

Widget tempButton(
  int status,
  String text,
) {
  Map<String, int> temperature = {
    "30": 1,
    "40": 2,
    "50": 3,
    "60": 4,
    "80": 5,
    "90": 6,
  };
  return Container(
    child: Center(
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 20))),
    height: 30,
    width: 80,
    decoration: BoxDecoration(
      color: Color(0xFF161B22),
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: temperature["$text"] == status
            ? Color(0xFF58A6FF)
            : Colors.transparent,
      ),
    ),
  );
}

Widget speedButton(int status, String text) {
  Map<String, int> speed = {
    "600": 1,
    "700": 2,
    "800": 3,
    "900": 4,
    "1000": 5,
  };
  return Container(
      child: Center(
          child:
              Text(text, style: TextStyle(color: Colors.white, fontSize: 20))),
      height: 30,
      width: 80,
      decoration: BoxDecoration(
        color: Color(0xFF161B22),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color:
              speed["$text"] == status ? Color(0xFFF9826C) : Colors.transparent,
        ),
      ));
}

class EngineSpeed extends StatefulWidget {
  @override
  _EngineSpeedState createState() => _EngineSpeedState();
}

class _EngineSpeedState extends State<EngineSpeed> {
  int speedStatus = 1;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                speedStatus = 1;
              });
            },
            child: speedButton(
              speedStatus,
              '600',
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                speedStatus = 2;
              });
            },
            child: speedButton(
              speedStatus,
              '700',
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                speedStatus = 3;
              });
            },
            child: speedButton(
              speedStatus,
              '800',
            ),
          ),
        ],
      )
    ]);
  }
}
