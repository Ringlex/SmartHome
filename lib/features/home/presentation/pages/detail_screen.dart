import 'package:flutter/material.dart';
import 'package:home_app/features/home/presentation/provider/room_tools.dart';

class Detailscreen extends StatefulWidget {
  final int id;
  final List<Tool> toolList; 

  const Detailscreen({Key key, this.id, this.toolList}) : super(key: key);

  @override
  _DetailscreenState createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            children: [
              TopBar(),
              RoomTools()
            ],
          );
        },
      ),
    );
  }
}

class TopBar extends StatefulWidget {
  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  bool state;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {},
          iconSize: 30,
        ),
        Text('Living room', style: TextStyle(color: Colors.white, fontSize: 26),),
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
    );
  }
}

class RoomTools extends StatefulWidget {
  /// Widget prepared to view a list of tools.
  /// 
  /// After assign a tool it should show a properties of this tool.
 

  final List<Tool> toolRoomList;
  final int id;

  const RoomTools({Key key, this.toolRoomList, this.id}) : super(key: key);
  @override
  _RoomToolsState createState() => _RoomToolsState();
}

class _RoomToolsState extends State<RoomTools> {
 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.toolRoomList.length,
      itemBuilder: (BuildContext context, int index){
        return Container(); // create some card/container for tool view
      },
    );
  }
}
