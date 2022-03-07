import 'package:flutter/material.dart';
import 'package:nexflix_clone/screen/home_screen.dart';
import 'package:nexflix_clone/screen/profile_screen.dart';
import 'package:nexflix_clone/widget/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TabController controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YongFlix',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.white,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              const HomeScreen(),

              Container(
                child: const Center(child: Text('search'),
                ),
              ),
              Container(
                child: const Center(child: Text('save'),
                ),
              ),
              const ProfileScreen()
            ],
          ),
          bottomNavigationBar: const Bottom(),
        ),
      ),
    );
  }
}
