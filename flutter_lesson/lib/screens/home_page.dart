import 'package:flutter/material.dart';
import 'package:flutter_lesson/screens/drawer_screen/drawer.dart';
import 'package:flutter_lesson/screens/latest_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
            centerTitle: true,
            backgroundColor: Colors.blue,
            title: const Text(
              'Daryo',
              style: TextStyle(color: Colors.white),
            ),
            bottom: const TabBar(
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                    child: Text("SO'NGI YANGILIKLAR",
                        style: TextStyle(color: Colors.white))),
                Tab(
                    child: Text("ASOSIY YANGILIKLAR",
                        style: TextStyle(color: Colors.white))),
                Tab(
                    child: Text("ENG KO'P",
                        style: TextStyle(color: Colors.white))),
              ],
            )),
        body: TabBarView(children: [
          const LatestPage(),
          Container(color: Colors.yellow),
          Container(color: Colors.green)
        ]),
        drawer: const MyDrawer(),
      ),
    );
  }
}
