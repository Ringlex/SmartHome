import 'package:flutter/material.dart';
import 'package:home_app/features/home/presentation/pages/detail_screen.dart';
import 'package:home_app/features/home/presentation/provider/room_tools.dart';
import 'package:home_app/features/home/presentation/widgets/light_bulb.dart';
import 'package:home_app/features/home/presentation/widgets/smart_tv.dart';
import 'package:home_app/features/home/presentation/widgets/tool_card.dart';

class BedroomView extends StatefulWidget {
  @override
  _BedroomViewState createState() => _BedroomViewState();
}

class _BedroomViewState extends State<BedroomView> {
  int _lengthList = bedroomTool.length;
  final List<Widget> bedroomPropertiesList = [
    LightBulb(),
    LightBulb(),
    SmartTv(),
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
                                toolList: bedroomTool,
                                icon: bedroomTool[index].icon,
                                title: bedroomTool[index].title,
                                toolName: bedroomTool[index].title,
                                propertiesList: bedroomPropertiesList,
                              )));
                },
                child: ToolCard(
                  title: bedroomTool[index].title,
                  toolName: bedroomTool[index].toolName,
                  icon: bedroomTool[index].icon,
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
