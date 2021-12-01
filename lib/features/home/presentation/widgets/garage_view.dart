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
  final List<Widget> bathroomPropertiesList = [
    LightBulb(),
  ];
  @override
  Widget build(BuildContext context) {
    List<Tool> _bathroomToolsList =
        Provider.of<ToolsManager>(context, listen: false).bathroomTools;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(_bathroomToolsList.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(
                                id: index + 1,
                                toolList: _bathroomToolsList,
                                icon: _bathroomToolsList[index].icon,
                                title: _bathroomToolsList[index].title,
                                toolName: _bathroomToolsList[index].title,
                                propertiesList: bathroomPropertiesList,
                              )));
                },
                child: ToolCard(
                  title: _bathroomToolsList[index].title,
                  toolName: _bathroomToolsList[index].toolName,
                  icon: _bathroomToolsList[index].icon,
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
