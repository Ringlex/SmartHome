// @dart=2.9
import 'package:flutter/material.dart';
import 'package:home_app/features/home/domain/entities/tool.dart';
import 'package:home_app/features/home/presentation/provider/tools_manager.dart';
import 'package:provider/provider.dart';

class SmartTv extends StatefulWidget {
  final String path;
  final String pathTools;
  final List<Tool> tool;
  final int toolIndex;

  const SmartTv({
    Key key,
    this.path,
    this.pathTools,
    this.tool,
    this.toolIndex,
  }) : super(key: key);
  @override
  _SmartTvState createState() => _SmartTvState();
}

class _SmartTvState extends State<SmartTv> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Volume(
              tool: widget.tool,
              toolIndex: widget.toolIndex,
              path: widget.path,
              pathTools: widget.pathTools,
            ),
            SizedBox(width: 50),
            Channel(
              tool: widget.tool,
              toolIndex: widget.toolIndex,
              path: widget.path,
              pathTools: widget.pathTools,
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        WriteChannel(
          tool: widget.tool,
          toolIndex: widget.toolIndex,
          path: widget.path,
          pathTools: widget.pathTools,
        ),
      ],
    );
  }
}

class Volume extends StatelessWidget {
  final String path;
  final String pathTools;
  final List<Tool> tool;
  final int toolIndex;

  const Volume({Key key, this.path, this.pathTools, this.tool, this.toolIndex})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'Volume',
        style: TextStyle(color: Colors.white, fontSize: 26),
      ),
      SizedBox(
        height: 20,
      ),
      functionalButton(
          10,
          10,
          10,
          10,
          80,
          80,
          Icon(
            Icons.add,
            color: Color(0xFFF9826C),
          ), () {
        tool[toolIndex].volume++;
        Provider.of<ToolsManager>(context, listen: false).updataData(
            path,
            tool[toolIndex].volume,
            toolIndex.toString(),
            pathTools,
            'volume');
      }),
      functionalButton(
          10,
          10,
          10,
          10,
          80,
          80,
          Icon(
            Icons.remove,
            color: Color(0xFFF9826C),
          ), () {
        if (tool[toolIndex].volume > 0) tool[toolIndex].volume--;

        Provider.of<ToolsManager>(context, listen: false).updataData(
            path,
            tool[toolIndex].volume,
            toolIndex.toString(),
            pathTools,
            'volume');
      }),
    ]);
  }
}

Widget functionalButton(
  double top,
  double left,
  double bottom,
  double right,
  double width,
  double height,
  Icon icon,
  Function onTap,
) {
  return Padding(
    padding:
        EdgeInsets.only(left: left, top: top, bottom: bottom, right: right),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        child: icon,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Color(0xFF161B22),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  );
}

class Channel extends StatelessWidget {
  final String path;
  final String pathTools;
  final List<Tool> tool;
  final int toolIndex;

  const Channel({Key key, this.path, this.pathTools, this.tool, this.toolIndex})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'Channel',
        style: TextStyle(color: Colors.white, fontSize: 26),
      ),
      SizedBox(
        height: 20,
      ),
      functionalButton(
          10,
          10,
          10,
          10,
          80,
          80,
          Icon(
            Icons.keyboard_arrow_up,
            color: Color(0xFFF9826C),
          ), () {
        tool[toolIndex].channel++;

        Provider.of<ToolsManager>(context, listen: false).updataData(
            path,
            tool[toolIndex].channel,
            toolIndex.toString(),
            pathTools,
            'channel');
      }),
      functionalButton(
          10,
          10,
          10,
          10,
          80,
          80,
          Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xFFF9826C),
          ), () {
        if (tool[toolIndex].channel > 0) tool[toolIndex].channel--;

        Provider.of<ToolsManager>(context, listen: false).updataData(
            path,
            tool[toolIndex].channel,
            toolIndex.toString(),
            pathTools,
            'channel');
      }),
    ]);
  }
}

class WriteChannel extends StatelessWidget {
  final String path;
  final String pathTools;
  final List<Tool> tool;
  final int toolIndex;

  const WriteChannel(
      {Key key, this.path, this.pathTools, this.tool, this.toolIndex})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final writeController = TextEditingController();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 3),
          decoration: BoxDecoration(
            color: Color(0xFF161B22),
            borderRadius: BorderRadius.circular(15),
          ),
          height: 60,
          width: 220,
          child: Center(
            child: TextFormField(
              showCursor: false,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 26),
              controller: writeController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Channel number',
                //labelText: 'Channel number',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ),
        SizedBox(
          width: 30,
        ),
        GestureDetector(
          onTap: () {
            tool[toolIndex].channel = int.parse(writeController.text);
            if (int.parse(writeController.text) > 0) {
              Provider.of<ToolsManager>(context, listen: false).updataData(
                  path,
                  int.parse(writeController.text),
                  toolIndex.toString(),
                  pathTools,
                  'channel');
            }
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFFF9826C),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              'Set',
              style: TextStyle(
                color: Color(0xFF161B22),
                fontSize: 24,
              ),
            ),
          ),
        )
      ],
    );
  }
}
