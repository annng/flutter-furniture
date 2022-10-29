import 'package:chair/ui/main/component/BottomHome.dart';
import 'package:chair/ui/main/screen/child/home/screen/home.dart';
import 'package:flutter/material.dart';

import '../../../common/cons/ColorCons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chair Apps',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
        backgroundColor: Colors.white
          ),
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onTapBottom(int selectedIndex) {
    setState(() {
      _selectedIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    const List<Widget> page = <Widget>[
      Home()
    ];

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Image.asset("asset/img/ic_drawer.png"),
          onPressed: () => {
            //todo open drawer
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: () => {
                //todo click profile
              },
              child: Image.asset("asset/img/ic_photo_profile.png"),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: page[_selectedIndex],
      ),
      bottomNavigationBar: BottomHome(selectedIndex: _selectedIndex, onTap: _onTapBottom),
    );
  }
}
