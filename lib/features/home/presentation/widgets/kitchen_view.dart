import 'package:flutter/material.dart';
import 'package:home_app/features/home/presentation/provider/room_tools.dart';
import 'package:home_app/features/home/presentation/widgets/tool_card.dart';

class KitchenView extends StatefulWidget {
  @override
  _KitchenViewState createState() => _KitchenViewState();
}

class _KitchenViewState extends State<KitchenView> {
  int _lengthList = kitchenTools.length;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(_lengthList, (index) {
              return ToolCard(
                title: kitchenTools[index].title,
                toolName: kitchenTools[index].toolName,
                icon: kitchenTools[index].icon,
              );
            }),
          ),
        );
      },
    );
  }
}
