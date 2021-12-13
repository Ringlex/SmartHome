// @dart=2.9
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:home_app/features/home/domain/entities/tool.dart';
import 'package:home_app/features/home/presentation/pages/add_tool_screen.dart';
import 'package:home_app/features/home/presentation/provider/tools_manager.dart';
import 'package:home_app/features/home/presentation/widgets/bathroom_view.dart';
import 'package:home_app/features/home/presentation/widgets/bedroom_view.dart';
import 'package:home_app/features/home/presentation/widgets/garage_view.dart';
import 'package:home_app/features/home/presentation/widgets/kitchen_view.dart';
import 'package:home_app/features/home/presentation/widgets/living_room_view.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int temperature = 0;
  @override
  void initState() {
    super.initState();

 
    _tabController = TabController(
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lista = context.select((ToolsManager n) => n.livingRoomTools);
    print(lista);
    //temperature = lista[0].tmeperature;

    return Scaffold(
      backgroundColor: Color(0xFF0D1117),
      appBar: AppBar(
        backgroundColor: Color(0xFF0D1117),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, right: 10),
            child: NotificationTemp(),
          ),
        ],
        title: InfoBar(),
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          indicatorColor: Color(0xFFF9826C),
          tabs: [
            Tab(
              text: 'Living room',
            ),
            Tab(
              text: 'Kitchen',
            ),
            Tab(
              text: 'Bedroom',
            ),
            Tab(
              text: 'Bathroom',
            ),
            Tab(
              text: 'Garage',
            ),
          ],
        ),
        //leading: InfoBar(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF238636),
        child: Icon(Icons.add),
        onPressed: () {
          //TODO remove below code - only example to connect with data base
          final database = FirebaseDatabase.instance.reference();

          database.child('rooms').child('kitchen').update({'lightOn': 0});
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddToolSreen()),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF21262D),
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.calendar_today,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80.0),
              child: IconButton(
                icon: Icon(
                  Icons.bar_chart,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: <Widget>[
        LivingRoomView(),
        KitchenView(),
        BedroomView(),
        BathroomView(),
        GarageView(),
      ]),
    );
  }
}

///Widget display main information for home.
///It's a temperature.
class InfoBar extends StatefulWidget {
  final height;
  final width;
  int temperature = 0;

  InfoBar({Key key, this.height, this.width, this.temperature})
      : super(key: key);

  @override
  State<InfoBar> createState() => _InfoBarState();
}

class _InfoBarState extends State<InfoBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ToolsManager>(
        builder: (context, providerData, _) => FutureBuilder(
            future: providerData.getTemp(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Container(
                  height: widget.height,
                  //width: 20,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 2.0,
                      top: 15,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.ac_unit,
                          color: Colors.white,
                          size: 26,
                        ),
                        SizedBox(width: 10),
                        Text('${snapshot.data}°C',
                            style: TextStyle(
                                color: Color(0xFF58A6FF), fontSize: 26)),
                      ],
                    ),
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            }));
  }
}

class NotificationTemp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.notifications,
        color: Colors.grey,
        size: 26,
      ),
    );
  }
}
