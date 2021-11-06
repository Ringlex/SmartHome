import 'package:flutter/material.dart';
import 'package:home_app/features/home/presentation/pages/detail_screen.dart';
import 'package:home_app/features/home/presentation/provider/room_tools.dart';
import 'package:home_app/features/home/presentation/widgets/light_bulb.dart';
import 'package:home_app/features/home/presentation/widgets/tool_card.dart';

class BathroomView extends StatefulWidget {
  @override
  _BathroomViewState createState() => _BathroomViewState();
}

class _BathroomViewState extends State<BathroomView> {
  int _lengthList = bathroomTool.length;
  final List<Widget> bathroomPropertiesList = [
    LightBulb(),

  ];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(_lengthList, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(
                                id: index + 1,
                                toolList: bathroomTool,
                                icon: bathroomTool[index].icon,
                                title: bathroomTool[index].title,
                                toolName: bathroomTool[index].title,
                                propertiesList: bathroomPropertiesList,
                              )));
                },
                child: ToolCard(
                  title: bathroomTool[index].title,
                  toolName: bathroomTool[index].toolName,
                  icon: bathroomTool[index].icon,
                ),
              );
            }),
          ),
        );
      },
    );
  }
}