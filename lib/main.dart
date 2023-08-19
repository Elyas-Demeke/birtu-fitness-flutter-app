import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}
final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 20, currentPageIndex = 0;
  List<String> titles = ['ስልጠናዎች','የራስዎ','እንቅስቃሴዎች','ሪፖርት','እኔ'];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    count = 10;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myappTheme,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            title: Text(titles[currentPageIndex], style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),)),
            // body: ListView.builder(
            //   padding: EdgeInsets.all(0),
            //   itemCount: 3,
            //   itemBuilder: (_, index) {
            //     return Container(
            //       color: Colors.amber[colorCodes[index]],
            //       child: Center(
            //         child: Text('Entry ${entries[index]}'),
            //       ),
            //       width:  500,
            //       height: 500,
            //     );
            //   },
            // ),
        // body: ListView(
        //   scrollDirection: Axis.horizontal,
        //   children: [
        //     Container(
        //       color: Colors.green,
        //       width: 720,
        //       height: 200,
        //     ),
        //     Container(
        //       color: Colors.yellow,
        //       width: 1000,
        //       height: 200,
        //     ),
        //     Container(
        //       color: Colors.red,
        //       width: 1000,
        //       height: 200,
        //     ),
        //     Positioned(
        //       child: Icon(Icons.verified),
        //       top: 25,
        //       left: 25,
        //     ),
        //   ],
        // ),
      body: [ElevatedButton(
        child: Text(titles[currentPageIndex]),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AboutScreen(),
              ) 
          );
        },
      ), ElevatedButton(
        child: Text('Second'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AboutScreen(),
              ) 
          );
        },
      ),ElevatedButton(
        child: Text('third'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AboutScreen(),
              ) 
          );
        },
      ),ElevatedButton(
        child: Text('fourth'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AboutScreen(),
              ) 
          );
        },
      ),ElevatedButton(
        child: Text('fifth'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AboutScreen(),
              ) 
          );
        },
      )][currentPageIndex],        
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              count++;
            });
          },
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: NavigationBar(
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home), 
              label: 'ስልጠናዎች',
              selectedIcon: Icon(Icons.home, color: Colors.blue[600]),
            ),
            NavigationDestination(
              icon: Icon(Icons.brush_sharp), 
              label: 'የራስዎ',
              selectedIcon: Icon(Icons.brush_sharp, color: Colors.blue[600],),
            ),
            NavigationDestination(
              icon: Icon(Icons.schema), 
              label: 'እንቅስቃሴዎች',
              selectedIcon: Icon(Icons.schema, color: Colors.blue[600]),
            ),
            NavigationDestination(
              icon: Icon(Icons.bar_chart), 
              label: 'ሪፖርት',
              selectedIcon: Icon(Icons.bar_chart, color: Colors.blue[600]),
            ),
            NavigationDestination(
              icon: Icon(Icons.person), 
              label: 'እኔ',
              selectedIcon: Icon(Icons.person, color: Colors.blue[600]),
            ),
          ],
          selectedIndex: currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.transparent,
          animationDuration: Duration(milliseconds: 150),
          // labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          backgroundColor: Colors.white,
        )),
        drawer: const Drawer(
          child: Text('Yo!'),
        ),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Flutter is fun!'),
      ),
      body: ElevatedButton(
        child: Text('MyApp'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MyApp(),
              ) 
          );
        },
      ),
    );
  }
}
final ThemeData myappTheme = ThemeData(
  navigationBarTheme: NavigationBarThemeData(
    labelTextStyle: MaterialStateProperty.resolveWith((state) {
      if (state.contains(MaterialState.selected)) {
        return const TextStyle(color: Colors.blue);
      }
      return const TextStyle(color: Colors.black);
    }),
  ),
);