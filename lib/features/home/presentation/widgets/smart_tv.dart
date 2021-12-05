// @dart=2.9
import 'package:flutter/material.dart';

class SmartTv extends StatefulWidget {
  @override
  _SmartTvState createState() => _SmartTvState();
}

class _SmartTvState extends State<SmartTv> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Volume(),
            SizedBox(width: 50),
            Channel(),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        WriteChannel(),
      ],
    );
  }
}

class Volume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'Volume',
        style: TextStyle(color: Colors.white, fontSize: 26),
      ),
      SizedBox(
        height: 20,
      ),
      functionalButton(
          10,
          10,
          10,
          10,
          80,
          80,
          Icon(
            Icons.add,
            color: Color(0xFFF9826C),
          ),
          () {}),
      functionalButton(
          10,
          10,
          10,
          10,
          80,
          80,
          Icon(
            Icons.remove,
            color: Color(0xFFF9826C),
          ),
          () {}),
    ]);
  }
}

Widget functionalButton(
  double top,
  double left,
  double bottom,
  double right,
  double width,
  double height,
  Icon icon,
  Function onTap,
) {
  return Padding(
    padding:
        EdgeInsets.only(left: left, top: top, bottom: bottom, right: right),
    child: GestureDetector(
      onTap:() => onTap,
      child: Container(
        child: icon,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Color(0xFF161B22),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  );
}

class Channel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'Channel',
        style: TextStyle(color: Colors.white, fontSize: 26),
      ),
      SizedBox(
        height: 20,
      ),
      functionalButton(
          10,
          10,
          10,
          10,
          80,
          80,
          Icon(
            Icons.keyboard_arrow_up,
            color: Color(0xFFF9826C),
          ),
          () {}),
      functionalButton(
          10,
          10,
          10,
          10,
          80,
          80,
          Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xFFF9826C),
          ),
          () {}),
    ]);
  }
}

class WriteChannel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final writeController = TextEditingController();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 3),
          decoration: BoxDecoration(
            color: Color(0xFF161B22),
            borderRadius: BorderRadius.circular(15),
          ),
          height: 60,
          width: 220,
          child: Center(
            child: TextFormField(
              showCursor: false,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 26),
              controller: writeController,
              decoration: InputDecoration(
              border: InputBorder.none,
                hintText: 'Channel number',
                //labelText: 'Channel number',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Container(
           padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xFFF9826C),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            'Set',
            style: TextStyle(
              color: Color(0xFF161B22),
              fontSize: 24,
            ),
          ),
        )
      ],
    );
  }
}
