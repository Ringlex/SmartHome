import 'package:flutter/material.dart';

class Detailscreen extends StatefulWidget {
  @override
  _DetailscreenState createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
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
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          indicatorColor: Color(0xFFF9826C),
          
        ),
      ),
      body: Container(),
    );
  }
}
