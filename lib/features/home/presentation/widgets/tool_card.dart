// @dart=2.9
import 'package:flutter/material.dart';

class ToolCard extends StatefulWidget {
  final String title;
  final String toolName;
  final Function funcTool;
  final int icon;

  const ToolCard({
    Key key,
    @required this.title,
    @required this.toolName,
    this.funcTool,
    @required this.icon,
  }) : super(key: key);
  @override
  _ToolCardState createState() => _ToolCardState();
}

class _ToolCardState extends State<ToolCard> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color(0xFF161B22),
            borderRadius: BorderRadius.circular(33),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Icon(
                IconData(widget.icon, fontFamily: 'MaterialIcons'),
                color: Color(0xFF58A6FF),
                size: 30,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                widget.toolName,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              Switch(
                value: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
                activeColor: Color(0xFF58A6FF),
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey[800],
              )
            ],
          )),
    );
  }
}
