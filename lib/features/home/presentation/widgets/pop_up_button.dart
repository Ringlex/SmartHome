// @dart=2.9
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:home_app/features/home/domain/entities/tool.dart';
import 'package:home_app/features/home/presentation/provider/tools_manager.dart';
import 'package:home_app/features/home/presentation/widgets/oven.dart';
import 'package:provider/provider.dart';

class PopUpButton extends StatefulWidget {
  final List<ItemMode> heatPosition;
  final String path;
  final String pathTools;
  final List<Tool> tool;
  final int toolIndex;
  final Widget child;
  final String variable;
  String kindOfMode;

  PopUpButton({
    Key key,
    this.path,
    this.pathTools,
    this.tool,
    this.toolIndex,
    this.heatPosition,
    this.child,
    this.variable,
    this.kindOfMode,
  }) : super(key: key);

  @override
  _PopUpButtonState createState() => _PopUpButtonState();
}

class _PopUpButtonState extends State<PopUpButton> {
  Widget _buildPopupMenu(
    List<ItemMode> list,
    CustomPopupMenuController _controller,
    List<Tool> toolList,
    String path,
    int toolIndex,
    String pathTools,
    String variable,
    String kindOfMode,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        padding: EdgeInsets.only(left: 0),
        width: 220,
        color: const Color(0xFF4C4C4C),
        child: Center(
          child: GridView.count(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            crossAxisCount: 3,
            crossAxisSpacing: 0,
            mainAxisSpacing: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: list
                .map(
                  (item) => GestureDetector(
                    onTap: () {
                      if (variable == 'bakingMode') {
                        widget.tool[toolIndex].bakingMode = item.title;
                        kindOfMode = item.title;
                      } else if (variable == 'bakingTemp') {
                        widget.tool[toolIndex].bakingTemp = item.title;
                        kindOfMode = item.title;
                      } else if (variable == 'coffeMode') {
                        widget.tool[toolIndex].coffeMode = item.title;
                        kindOfMode = item.title;
                      }
                      setState(() {
                        Provider.of<ToolsManager>(context, listen: false)
                            .updataData(
                          widget.path,
                          kindOfMode,
                          widget.toolIndex.toString(),
                          widget.pathTools,
                          widget.variable,
                        );
                        _controller.hideMenu();
                      });
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      child: Center(
                        child: Text(
                          item.title,
                          style: TextStyle(
                              color: item.title == widget.kindOfMode
                                  ? Colors.blue
                                  : Colors.grey,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  CustomPopupMenuController _controller = CustomPopupMenuController();
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.kindOfMode);

    return CustomPopupMenu(
      controller: _controller,
      position: PreferredPosition.bottom,
      pressType: PressType.singleClick,
      child: widget.child,
      menuBuilder: () => _buildPopupMenu(
        widget.heatPosition,
        _controller,
        widget.tool,
        widget.path,
        widget.toolIndex,
        widget.pathTools,
        widget.variable,
        widget.kindOfMode,
      ),
    );
  }
}
