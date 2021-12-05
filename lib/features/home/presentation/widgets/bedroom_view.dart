// @dart=2.9
import 'package:flutter/material.dart';
import 'package:home_app/features/home/domain/entities/tool.dart';
import 'package:home_app/features/home/presentation/pages/detail_screen.dart';
import 'package:home_app/features/home/presentation/provider/room_tools.dart';
import 'package:home_app/features/home/presentation/provider/tools_manager.dart';
import 'package:home_app/features/home/presentation/widgets/light_bulb.dart';
import 'package:home_app/features/home/presentation/widgets/smart_tv.dart';
import 'package:home_app/features/home/presentation/widgets/tool_card.dart';
import 'package:provider/provider.dart';

class BedroomView extends StatefulWidget {
  @override
  _BedroomViewState createState() => _BedroomViewState();
}

class _BedroomViewState extends State<BedroomView> {
  final List<Widget> bedroomPropertiesList = [
    LightBulb(),
    LightBulb(),
    SmartTv(),
  ];
  @override
  Widget build(BuildContext context) {
    List<Tool> _bedroomToolsList =
        Provider.of<ToolsManager>(context, listen: false).bedroomTools;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(_bedroomToolsList.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          // ignore: missing_required_param
                          builder: (context) => DetailScreen(
                                id: index + 1,
                                toolList: _bedroomToolsList,
                                icon: _bedroomToolsList[index].icon,
                                title: _bedroomToolsList[index].title,
                                toolName: _bedroomToolsList[index].title,
                                propertiesList: bedroomPropertiesList,
                                path: 'bedroom',
                                pathTool: 'bedroomTools',
                              )));
                },
                child: ToolCard(
                  title: _bedroomToolsList[index].title,
                  toolName: _bedroomToolsList[index].toolName,
                  icon: _bedroomToolsList[index].icon,
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
