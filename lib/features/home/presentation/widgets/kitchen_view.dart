// @dart=2.9
import 'package:flutter/material.dart';
import 'package:home_app/features/home/domain/entities/tool.dart';
import 'package:home_app/features/home/presentation/pages/detail_screen.dart';
import 'package:home_app/features/home/presentation/provider/room_tools.dart';
import 'package:home_app/features/home/presentation/provider/tools_manager.dart';
import 'package:home_app/features/home/presentation/widgets/coffe_express.dart';
import 'package:home_app/features/home/presentation/widgets/light_bulb.dart';
import 'package:home_app/features/home/presentation/widgets/oven.dart';
import 'package:home_app/features/home/presentation/widgets/tool_card.dart';
import 'package:provider/provider.dart';

class KitchenView extends StatefulWidget {
  @override
  _KitchenViewState createState() => _KitchenViewState();
}

class _KitchenViewState extends State<KitchenView> {
  @override
  Widget build(BuildContext context) {
    List<Tool> _kitchenToolsList =
        Provider.of<ToolsManager>(context, listen: false).kitchenTools;
    final List<Widget> kitchenPropertiesList = [
      CoffeExpress(),
      Oven(),
      LightBulb(
        tool: _kitchenToolsList,
        toolIndex: 2,
        path: 'kitchen',
        pathTools: 'kitchenTools',
      )
    ];
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(_kitchenToolsList.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          // ignore: missing_required_param
                          builder: (context) => DetailScreen(
                                id: index + 1,
                                toolList: _kitchenToolsList,
                                icon: _kitchenToolsList[index].icon,
                                title: _kitchenToolsList[index].title,
                                toolName: _kitchenToolsList[index].title,
                                propertiesList: kitchenPropertiesList,
                                path: 'kitchen',
                                pathTool: 'kitchenTools',
                              )));
                },
                child: ToolCard(
                  title: _kitchenToolsList[index].title,
                  toolName: _kitchenToolsList[index].toolName,
                  icon: _kitchenToolsList[index].icon,
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
