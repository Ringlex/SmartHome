// @dart=2.9

import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:home_app/features/home/domain/entities/tool.dart';
import 'package:home_app/features/home/presentation/provider/tools_manager.dart';
import 'package:home_app/features/home/presentation/widgets/pop_up_button.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class Oven extends StatefulWidget {
  final String path;
  final String pathTools;
  final List<Tool> tool;
  final int toolIndex;

  const Oven({Key key, this.path, this.pathTools, this.tool, this.toolIndex})
      : super(key: key);
  @override
  _OvenState createState() => _OvenState();
}

class _OvenState extends State<Oven> {
  double valueTemperature = 55;
  int currentValueTimer = 0;

  @override
  void didChangeDependencies() {
    
    super.didChangeDependencies();
    currentValueTimer = Provider.of<ToolsManager>(context, listen: true).kitchenTools[1].timer;
  }
//TODO Number picker doesn't update a number
  void showDialogTimer(
    int currentValue,
    String path,
    String pathTools,
    List<Tool> tool,
    int toolIndex,
  )  {
     showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Timer'),
            content: NumberPicker(
              minValue: 0,
              maxValue: 100,
              step: 10,
              value: currentValue,
              onChanged: (value) {
                setState(() {
                  currentValue = value;
                  widget.tool[widget.toolIndex].timer = currentValue;
              });
              },
            ),
            actions: [
              MaterialButton(
                child: Text("Ok"),
                onPressed: () {
                  
                  Provider.of<ToolsManager>(context, listen: false).updataData(
                    path,
                    widget.tool[widget.toolIndex].timer,
                    toolIndex.toString(),
                    pathTools,
                    'timer',
                  );
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
  
  @override
  Widget build(BuildContext context) {
    // int currentValueTimer = widget.tool[widget.toolIndex].timer;
    // var zmienna = Provider.of<ToolsManager>(context, listen: true)
    //     .kitchenTools[1]
    //     .bakingMode;
    // print("zmienna + $zmienna");
    List<ItemMode> heatPosition = [
      ItemMode(
        title: 'Up',
      ),
      ItemMode(
        title: 'Down',
      ),
      ItemMode(
        title: 'Up & Down',
      ),
    ];

    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PopUpButton(
              tool: widget.tool,
              kindOfMode: widget.tool[widget.toolIndex].bakingMode,
              toolIndex: widget.toolIndex,
              pathTools: widget.pathTools,
              path: widget.path,
              heatPosition: heatPosition,
              variable: 'bakingMode',
              child: functionButton(
                Icon(Icons.settings_overscan,
                    size: 50, color: Color(0xFF58A6FF)),
              ),
            ),
            //TODO add functionality for baking mode
            SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                if (widget.tool[widget.toolIndex].fanOn == 1)
                  widget.tool[widget.toolIndex].fanOn = 0;
                else
                  widget.tool[widget.toolIndex].fanOn = 1;

                Provider.of<ToolsManager>(context, listen: false).updataData(
                  widget.path,
                  widget.tool[widget.toolIndex].fanOn,
                  widget.toolIndex.toString(),
                  widget.pathTools,
                  'fanOn',
                );
                setState(() {});
              },
              child: functionButton(
                Icon(
                    widget.tool[widget.toolIndex].fanOn == 1
                        ? Icons.pause
                        : Icons.play_arrow,
                    size: 50,
                    color: Color(0xFF58A6FF)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                showDialogTimer( currentValueTimer, widget.path, widget.pathTools, widget.tool,
                    widget.toolIndex);
              },
              child: functionButton(
                Icon(Icons.toys, size: 50, color: Color(0xFF58A6FF)),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            PopUpButton(
              tool: widget.tool,
              kindOfMode: widget.tool[widget.toolIndex].bakingMode,
              toolIndex: widget.toolIndex,
              pathTools: widget.pathTools,
              path: widget.path,
              heatPosition: heatPosition,
              variable: 'bakingMode',
              child: functionButton(
                Icon(Icons.bakery_dining, size: 50, color: Color(0xFF58A6FF)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Text('Temperature',
            style: TextStyle(color: Colors.white, fontSize: 26)),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Slider(
            activeColor: Color(0xFFF9826C),
            inactiveColor: Color(0x80F9826C),
            value: widget.tool[widget.toolIndex].bakingTemp.toDouble(),
            onChanged: (double value) {
              setState(() {
                valueTemperature = value.roundToDouble();
                widget.tool[widget.toolIndex].bakingTemp =
                    valueTemperature.toInt();
                Provider.of<ToolsManager>(context, listen: false).updataData(
                    widget.path,
                    widget.tool[widget.toolIndex].bakingTemp,
                    widget.toolIndex.toString(),
                    widget.pathTools,
                    'bakingTemp');
              });
            },
            min: 0,
            max: 250,
            divisions: 25,
            label: widget.tool[widget.toolIndex].bakingTemp.toString(),
          ),
        ),
      ]),
    );
  }
}

/// Widget [functionButton] allow add a icon of button
/// and function. Applies to only [Oven].
Widget functionButton(
  Icon icon,
) {
  return Container(
    child: Center(
      child: icon,
    ),
    height: 110,
    width: 110,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Color(0xFF21262D),
    ),
  );
}

class ItemMode {
  var title;
  Function setMode;

  ItemMode({this.title, this.setMode});
}
