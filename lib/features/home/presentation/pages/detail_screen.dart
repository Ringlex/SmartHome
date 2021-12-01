import 'package:flutter/material.dart';
import 'package:home_app/features/home/domain/entities/tool.dart';
import 'package:home_app/features/home/presentation/provider/room_tools.dart';
import 'package:home_app/features/home/presentation/provider/tab_manager.dart';
import 'package:home_app/features/home/presentation/widgets/air_conditioner.dart';
import 'package:home_app/features/home/presentation/widgets/light_bulb.dart';
import 'package:home_app/features/home/presentation/widgets/smart_tv.dart';
import 'package:home_app/features/home/presentation/widgets/washing_machine.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  final List<Tool> toolList;
  final int icon;
  final String title;
  final String toolName;
  final List<Widget> propertiesList;

  const DetailScreen(
      {Key key,
      this.id,
      this.toolList,
      this.icon,
      this.title,
      this.toolName,
      this.propertiesList})
      : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  void initState() {
   
    super.initState();
     Provider.of<TabManager>(context, listen: false).setIndexTab(widget.id - 1);
  }
  

  @override
  Widget build(BuildContext context) {
    
    int actualTab = Provider.of<TabManager>(context, listen: false).actualTab;
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
                roomTools(actualTab),
                SizedBox(height: 30),
                PropertiesTools(
                  index: widget.id - 1,
                  propertiesList: widget.propertiesList,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
  Widget roomTools(int activeTool ) {
    
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          padding: EdgeInsets.only(left: 10),
          scrollDirection: Axis.horizontal,
          itemCount: widget.toolList.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == activeTool) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    //activeTool = index;
                    Provider.of<TabManager>(context, listen: false).setIndexTab(index);
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
                          child: Icon(
                            IconData(widget.toolList[index].icon,
                                fontFamily: 'MaterialIcons'),
                            color: Color(0xFF58A6FF),
                            size: 30,
                          ),
                          height: 40,
                          width: 40,
                        )),
                        Center(
                          child: Text(
                            widget.toolList[index].title,
                            style: TextStyle(color: Colors.white, fontSize: 23),
                          ),
                        ),
                        Text(
                          widget.toolList[index].toolName,
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
                    Provider.of<TabManager>(context, listen: false).setIndexTab(index);
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
                          child: Icon(
                            IconData(widget.toolList[index].icon,
                                fontFamily: 'MaterialIcons'),
                            color: Color(0xFF58A6FF),
                            size: 30,
                          ),
                          height: 40,
                          width: 40,
                        )),
                        Center(
                          child: Text(
                            widget.toolList[index].title,
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                        ),
                        Text(
                          widget.toolList[index].toolName,
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


class PropertiesTools extends StatefulWidget {
  final int index;
  final List<Widget> propertiesList;

  const PropertiesTools({Key key, this.index, this.propertiesList})
      : super(key: key);
  @override
  _PropertiesToolsState createState() => _PropertiesToolsState();
}

class _PropertiesToolsState extends State<PropertiesTools> {
  final List<Widget> livingPropertiesList = [
    AirConditioner(),
    SmartTv(),
    LightBulb(),
    WashingMachine(),
  ];
  // final List<Widget> kitchenPropertiesList = [

  // ];
  @override
  Widget build(BuildContext context) {
    int index = Provider.of<TabManager>(context, listen: true).actualTab;
    return Container(
      child: widget.propertiesList[index],
    );
  }
}
