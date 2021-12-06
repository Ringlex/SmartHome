// @dart=2.9
import 'package:flutter/material.dart';
import 'package:home_app/features/home/domain/entities/tool.dart';
import 'package:home_app/features/home/presentation/provider/tools_manager.dart';
import 'package:provider/provider.dart';

class LightBulb extends StatefulWidget {
  final String path;
  final String pathTools;
  final List<Tool> tool;
  final int toolIndex;

  const LightBulb({
    Key key,
    this.path,
    this.pathTools,
    @required this.tool,
    @required this.toolIndex,
  }) : super(key: key);
  @override
  _LightBulbState createState() => _LightBulbState();
}

class _LightBulbState extends State<LightBulb> {
  
  @override
  Widget build(BuildContext context) {
    double valueBright = widget.tool[widget.toolIndex].brightness.toDouble();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 60),
              child: Text(
                'Brightness',
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Slider(
                activeColor: Color(0xFFF9826C),
                inactiveColor: Color(0x80F9826C),
                value: valueBright,
                onChanged: (double value) {
                  setState(() {
                    valueBright = value.roundToDouble();
                    widget.tool[widget.toolIndex].brightness = valueBright.toInt();
                    Provider.of<ToolsManager>(context, listen: false).updataData(
                  widget.path,
                  widget.tool[widget.toolIndex].brightness,
                  widget.toolIndex.toString(),
                  widget.pathTools,
                  'brightness');
                  });
                },
                min: 0,
                max: 100,
                divisions: 20,
                label: valueBright.toInt().toString(),
              ),
            ),
          ],
        );
      },
    );
  }
}
