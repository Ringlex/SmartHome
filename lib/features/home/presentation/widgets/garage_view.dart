// @dart=2.9
import 'package:flutter/material.dart';
import 'package:home_app/features/home/domain/entities/tool.dart';
import 'package:home_app/features/home/presentation/pages/detail_screen.dart';
import 'package:home_app/features/home/presentation/provider/room_tools.dart';
import 'package:home_app/features/home/presentation/provider/tools_manager.dart';
import 'package:home_app/features/home/presentation/widgets/light_bulb.dart';
import 'package:home_app/features/home/presentation/widgets/tool_card.dart';
import 'package:provider/provider.dart';

class GarageView extends StatefulWidget {
  @override
  _GarageViewState createState() => _GarageViewState();
}

class _GarageViewState extends State<GarageView> {
 
  @override
  Widget build(BuildContext context) {
    List<Tool> _garageToolsList =
        Provider.of<ToolsManager>(context, listen: false).garageTools;
         final List<Widget> bathroomPropertiesList = [
    LightBulb(tool: _garageToolsList,
        toolIndex: 0,
        path: 'garage',
        pathTools: 'garageTools',),
  ];
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(_garageToolsList.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          // ignore: missing_required_param
                          builder: (context) => DetailScreen(
                                id: index + 1,
                                toolList: _garageToolsList,
                                icon: _garageToolsList[index].icon,
                                title: _garageToolsList[index].title,
                                toolName: _garageToolsList[index].title,
                                propertiesList: bathroomPropertiesList,
                                path: 'garage',
                                pathTool: 'garageTools',
                              )));
                },
                child: ToolCard(
                  title: _garageToolsList[index].title,
                  toolName: _garageToolsList[index].toolName,
                  icon: _garageToolsList[index].icon,
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
