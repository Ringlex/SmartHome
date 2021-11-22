import 'package:flutter/material.dart';
import 'package:home_app/features/home/presentation/pages/home_screen.dart';
import 'package:home_app/features/home/presentation/provider/tab_manager.dart';
import 'package:home_app/features/home/presentation/provider/tools_manager.dart';
import 'package:provider/provider.dart';
import 'injection_container.dart' as di;

void main() async {
  // ignore: await_only_futures
  await di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TabManager>(create: (_) => di.sl<TabManager>()),
        ChangeNotifierProvider<ToolsManager>(
          create: (_) => di.sl<ToolsManager>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Smart home'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
