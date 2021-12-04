import 'package:flutter/material.dart';
import 'package:home_app/features/home/domain/entities/tool.dart';
import 'package:home_app/features/home/presentation/pages/detail_screen.dart';
import 'package:home_app/features/home/presentation/provider/room_tools.dart';
import 'package:home_app/features/home/presentation/provider/tools_manager.dart';
import 'package:home_app/features/home/presentation/widgets/light_bulb.dart';
import 'package:home_app/features/home/presentation/widgets/tool_card.dart';
import 'package:provider/provider.dart';

class BathroomView extends StatefulWidget {
  @override
  _BathroomViewState createState() => _BathroomViewState();
}

class _BathroomViewState extends State<BathroomView> {
  final List<Widget> bathroomPropertiesList = [
    LightBulb(),
  ];
  @override
  Widget build(BuildContext context) {
    List<Tool> _bathroomToolList =
        Provider.of<ToolsManager>(context, listen: false).bathroomTools;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(_bathroomToolList.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(
                                id: index + 1,
                                toolList: _bathroomToolList,
                                icon: _bathroomToolList[index].icon,
                                title: _bathroomToolList[index].title,
                                toolName: _bathroomToolList[index].title,
                                propertiesList: bathroomPropertiesList,
                                path: 'bathroom',
                                pathTool: 'bathroomTools',
                              )));
                },
                child: ToolCard(
                  title: _bathroomToolList[index].title,
                  toolName: _bathroomToolList[index].toolName,
                  icon: _bathroomToolList[index].icon,
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
