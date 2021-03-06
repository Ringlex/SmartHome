import 'package:flutter/material.dart';

class Tool {
  final int id;
  final String title;
  final String toolName;
  final Function funcTool;
  final Icon icon;

  Tool({this.id, this.title, this.toolName, this.funcTool, this.icon});
}

List<Tool> livingRoomTools = [
  Tool(
    id: 1,
    title: 'Air Conditioner',
    toolName: 'Voltas RF140',
    funcTool: () {},
    icon: Icon(
      Icons.wb_sunny,
      color: Color(0xFF58A6FF),
      size: 30,
    ),
  ),
  Tool(
    id: 2,
    title: 'Smart TV',
    toolName: 'Samsung EXSS 4K',
    funcTool: () {},
    icon: Icon(
      Icons.tv,
      color: Color(0xFF58A6FF),
      size: 30,
    ),
  ),
  Tool(
    id: 3,
    title: 'Light Bulb',
    toolName: 'Osram 27E',
    funcTool: () {},
    icon: Icon(
      Icons.lightbulb_outline_sharp,
      color: Color(0xFF58A6FF),
      size: 30,
    ),
  ),
  Tool(
    id: 4,
    title: 'Washing Machine',
    toolName: 'Bosch 7kg 5475',
    funcTool: () {},
    icon: Icon(
      Icons.local_laundry_service,
      color: Color(0xFF58A6FF),
      size: 30,
    ),
  ),
];

List<Tool> kitchenTools = [
  Tool(
    id: 1,
    title: 'Coffe express',
    toolName: 'Siemens Q6',
    funcTool: () {},
    icon: Icon(
      Icons.local_cafe,
      color: Color(0xFF58A6FF),
      size: 30,
    ),
  ),
  Tool(
    id: 2,
    title: 'Oven',
    toolName: 'Samsung EXS',
    funcTool: () {},
    icon: Icon(
      Icons.hvac,
      color: Color(0xFF58A6FF),
      size: 30,
    ),
  ),
  Tool(
    id: 3,
    title: 'Light Bulb',
    toolName: 'Osram 27E',
    funcTool: () {},
    icon: Icon(
      Icons.lightbulb_outline_sharp,
      color: Color(0xFF58A6FF),
      size: 30,
    ),
  ),
];

List<Tool> bedroomTool = [
  Tool(
    id: 1,
    title: 'Light Bulb',
    toolName: 'Osram 27E',
    funcTool: () {},
    icon: Icon(
      Icons.lightbulb_outline_sharp,
      color: Color(0xFF58A6FF),
      size: 30,
    ),
  ),
  Tool(
    id: 2,
    title: 'Night lamp',
    toolName: 'Osram 27E',
    funcTool: () {},
    icon: Icon(
      Icons.lightbulb,
      color: Color(0xFF58A6FF),
      size: 30,
    ),
  ),
  Tool(
    id: 3,
    title: 'Smart TV',
    toolName: 'Samsung EXSS 4K',
    funcTool: () {},
    icon: Icon(
      Icons.tv,
      color: Color(0xFF58A6FF),
      size: 30,
    ),
  ),
];

List<Tool> bathroomTool = [
  Tool(
    id: 1,
    title: 'Light Bulb',
    toolName: 'Osram 27E',
    funcTool: () {},
    icon: Icon(
      Icons.lightbulb_outline_sharp,
      color: Color(0xFF58A6FF),
      size: 30,
    ),
  ),
];

List<List> roomLists = [
  kitchenTools,
  livingRoomTools,
  bathroomTool,
];
