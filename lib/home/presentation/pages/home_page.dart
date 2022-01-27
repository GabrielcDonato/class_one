import 'package:flutter/material.dart';

import 'pageViews/one_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();

  int indexBottomNavigationBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AppBar"),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Gabriel"),
            accountEmail: Text(
              "gabrielcdonato@gmai.com",
            ),
            currentAccountPicture: CircleAvatar(
              child: Text(
                "G",
              ),
              backgroundColor: Colors.amber,
            ),
          ),
          ListTile(
            title: Text("Item 1"),
            trailing: Icon(
              Icons.arrow_forward,
            ),
            onTap: () {
              _pageController.jumpToPage(0);
              Navigator.pop(context);
              setState(() {
                indexBottomNavigationBar = 0;
              });
            },
          ),
          ListTile(
            title: Text("Item 2"),
            trailing: Icon(
              Icons.arrow_forward,
            ),
            onTap: () {
              _pageController.jumpToPage(1);
              Navigator.pop(context);
              setState(() {
                indexBottomNavigationBar = 1;
              });
            },
          ),
          ListTile(
            title: Text("Item 3"),
            trailing: Icon(
              Icons.arrow_forward,
            ),
            onTap: () {
              _pageController.jumpToPage(2);
              Navigator.pop(context);
              setState(() {
                indexBottomNavigationBar = 2;
              });
            },
          ),
        ],
      )),
      body: PageView(
        controller: _pageController,
        children: [
          const OnePage(),
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
