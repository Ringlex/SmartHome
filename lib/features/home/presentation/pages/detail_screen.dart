import 'package:flutter/material.dart';
import 'package:home_app/features/home/presentation/provider/room_tools.dart';
import 'package:home_app/features/home/presentation/widgets/air_conditioner.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  final List<Tool> toolList;
  final Icon icon;
  final String title;
  final String toolName;

  const DetailScreen(
      {Key key, this.id, this.toolList, this.icon, this.title, this.toolName})
      : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D1117),
      body: SingleChildScrollView(
              child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                TopBar(
                  title: widget.toolName,
                ),
                RoomTools(
                  id: widget.id,
                  toolName: widget.toolName,
                  toolRoomList: widget.toolList,
                  title: widget.title,
                ),
                SizedBox(height: 30),
                PropertiesTools(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class TopBar extends StatefulWidget {
  final double constrains;
  final String title;

  const TopBar({Key key, this.constrains, this.title}) : super(key: key);
  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            iconSize: 30,
          ),
          Expanded(
            child: Center(
              child: Text(
                'Living room',
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
            ),
          ),
          Switch(
            value: state,
            onChanged: (value) {
              setState(() {
                state = value;
              });
            },
            activeColor: Color(0xFF58A6FF),
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.grey[800],
          )
        ],
      ),
    );
  }
}

class RoomTools extends StatefulWidget {
  /// Widget prepared to view a list of tools.
  ///
  /// After assign a tool it should show a properties of this tool.

  final List<Tool> toolRoomList;
  final int id;
  final Icon icon;
  final String title;
  final String toolName;

  const RoomTools(
      {Key key,
      this.toolRoomList,
      this.id,
      this.icon,
      this.title,
      this.toolName})
      : super(key: key);
  @override
  _RoomToolsState createState() => _RoomToolsState();
}

class _RoomToolsState extends State<RoomTools> {
  int activeTool = 0;
  @override
  void initState() {
    activeTool = widget.id - 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          padding: EdgeInsets.only(left: 10),
          scrollDirection: Axis.horizontal,
          itemCount: widget.toolRoomList.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == activeTool) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    activeTool = index;
                  });
                },
                child: Container(
                  height: 50,
                  width: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                            child: SizedBox(
                          child: widget.toolRoomList[index].icon,
                          height: 40,
                          width: 40,
                        )),
                        Center(
                          child: Text(
                            widget.toolRoomList[index].title,
                            style: TextStyle(color: Colors.white, fontSize: 23),
                          ),
                        ),
                        Text(
                          widget.toolRoomList[index].toolName,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ); // create some card/container for tool view
            } else {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    activeTool = index;
                  });
                },
                child: Container(
                  height: 50,
                  width: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                            child: SizedBox(
                          child: widget.toolRoomList[index].icon,
                          height: 40,
                          width: 40,
                        )),
                        Center(
                          child: Text(
                            widget.toolRoomList[index].title,
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                        ),
                        Text(
                          widget.toolRoomList[index].toolName,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            // create some card/container for tool view
          },
        ),
      ),
    );
  }
}
class PropertiesTools extends StatefulWidget {
  final int index;

  const PropertiesTools({Key key, this.index}) : super(key: key);
  @override
  _PropertiesToolsState createState() => _PropertiesToolsState();
}

class _PropertiesToolsState extends State<PropertiesTools> {
  final List<Widget> propertiesList = [
    AirConditioner(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: propertiesList[0],
      
    );
  }
}
