import 'package:flutter/material.dart';

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
                selectButton(Icon(Icons.mode_edit), 'Mode', () {}),
                selectButton(Icon(Icons.mode_edit), 'Mode', () {}),
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
          ],
        );
      },
    );
  }
}

Widget selectButton(Icon icon, String title, Function func) {
  return Container(
    child: icon,
    height: 80,
    width: 80,
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
    width: 80,
    height: 80,
    decoration: BoxDecoration(
      color: state ? Colors.red : Colors.green,
      borderRadius: BorderRadius.circular(15),
    ),
  );
}
