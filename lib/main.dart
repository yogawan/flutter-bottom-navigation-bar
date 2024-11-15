import 'package:flutter/material.dart';

import 'package:app/pages/learn_page.dart';
import 'package:app/pages/news_page.dart';
import 'package:app/pages/rank_page.dart';
import 'package:app/pages/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    LearnPage(),
    NewsPage(),
    RankPage(),
    ProfilePage()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xFFF5ECF7),
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              height: 40,
            ),
          ],
        )
      ),
      body: Center(
        child: _widgetOptions.elementAt(currentPageIndex),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: ImageIcon(
                AssetImage('assets/learn.png'),
            ),
            label: 'Learn',
          ),
          NavigationDestination(
            icon: ImageIcon(
                AssetImage('assets/news.png'),
            ),
            label: 'News',
          ),
          NavigationDestination(
            icon: ImageIcon(
                AssetImage('assets/rank.png'),
            ),
            label: 'Rank',
          ),
          NavigationDestination(
            icon: ImageIcon(
                AssetImage('assets/profile.png'),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}