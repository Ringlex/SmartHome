import 'package:flutter/material.dart';
import 'package:home_app/features/home/domain/entities/tool.dart';
import 'package:home_app/features/home/presentation/pages/detail_screen.dart';
import 'package:home_app/features/home/presentation/provider/room_tools.dart';
import 'package:home_app/features/home/presentation/provider/tools_manager.dart';
import 'package:home_app/features/home/presentation/widgets/air_conditioner.dart';
import 'package:home_app/features/home/presentation/widgets/light_bulb.dart';
import 'package:home_app/features/home/presentation/widgets/smart_tv.dart';
import 'package:home_app/features/home/presentation/widgets/tool_card.dart';
import 'package:home_app/features/home/presentation/widgets/washing_machine.dart';
import 'package:provider/provider.dart';

class LivingRoomView extends StatefulWidget {
  @override
  _LivingRoomViewState createState() => _LivingRoomViewState();
}

class _LivingRoomViewState extends State<LivingRoomView> {
  @override
  @override
  Widget build(BuildContext context) {
    List<Tool> livingRoomList =
        Provider.of<ToolsManager>(context, listen: false).livingRoomTools;
    final List<Widget> livingPropertiesList = [
      AirConditioner(
        tool: livingRoomList,
        toolIndex: 0,
        path: 'livingRoom',
        pathTools: 'livingRoomTools',
      ),
      SmartTv(
        tool: livingRoomList,
        toolIndex: 1,
        path: 'livingRoom',
        pathTools: 'livingRoomTools',
      ),
      LightBulb(tool: livingRoomList,
        toolIndex: 2,
        path: 'livingRoom',
        pathTools: 'livingRoomTools',),
      WashingMachine(),
    ];

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(livingRoomList.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(
                                id: index + 1,
                                toolList: livingRoomList,
                                icon: livingRoomList[index].icon,
                                title: livingRoomList[index].title,
                                toolName: livingRoomList[index].title,
                                propertiesList: livingPropertiesList,
                                path: 'livingRoom',
                                pathTool: 'livingRoomTools',
                              )));
                },
                child: ToolCard(
                  title: livingRoomList[index].title,
                  toolName: livingRoomList[index].toolName,
                  icon: livingRoomList[index].icon,
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
