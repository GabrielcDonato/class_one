import 'package:flutter/material.dart';

import 'pageViews/one_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();

  int indexBottomNavigationBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          OnePage(),
          Container(color: Colors.blue),
          Container(color: Colors.yellow),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBottomNavigationBar,
        onTap: (int page) {
          setState(() {
            indexBottomNavigationBar = page;
          });
          _pageController.animateToPage(
            page,
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: "ze",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: "joao",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: "homer",
          ),
        ],
      ),
    );
  }
}
