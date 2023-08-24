import 'package:birtu_fitness/Training.dart';
import 'package:birtu_fitness/custom.dart';

import 'aboutScreen.dart';
import 'splash.dart';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main(List<String> args) async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Keeps the native splash screen alive
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // mimics delays for heavy loading
  // await delayingForGivenSeconds();

  //put this code in places where heavy load is present to remove the native splash screen.
  // FlutterNativeSplash.remove();
  runApp(const MyApp());
}

// timeout function
Future delayingForGivenSeconds() async {
  await Future.delayed(Duration(seconds: 3));
}

final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myappTheme,
      title: 'Birtu fitness',
      // use Splash() to add custom splash with no library,
      // home: Splash(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _count = 20, _currentPageIndex = 0; 
  String currentPage = 'training';

  List<String> titles = ['ስልጠናዎች', 'የራስዎ', 'እንቅስቃሴዎች', 'ሪፖርት', 'እኔ'];

  void initState() {
    super.initState();
  }

  Widget _getBody() {
    switch (_currentPageIndex){
      case 0:
        return const Training();
      case 1:
        return const Custom();
      case 2:
        return Text('This is the እንቅስቃሴዎች screen');
      case 3:
        return Text('This is the ሪፖርት screen');
      case 4:
        return Text('This is the እኔ screen');
      default:
        return Text('Error occoured tracking current page screen');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: Container(
            child: Text(
              titles[_currentPageIndex],
              style: TextStyle(
                  fontFamily: 'Abyssinica SIL',
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  letterSpacing: .5
                  ),
            ),
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
          )),
          body: _getBody(),
      // floatingActionButton: FloatingActionButton(
      //     child: const Icon(Icons.add),
      //     onPressed: () {
      //       setState(() {
      //         _count++;
      //       });
      //     },
      //   ),
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
                selectedIcon: Icon(
                  Icons.brush_sharp,
                  color: Colors.blue[600],
                ),
              ),
              NavigationDestination(
                icon: Icon(Icons.schema, size: 20),
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
            selectedIndex: _currentPageIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            indicatorColor: Colors.transparent,
            animationDuration: Duration(milliseconds: 150),
            // labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            backgroundColor: Colors.white,
            height: 60,
            
          )),
      // drawer: const Drawer(
      //   child: Text('Yo!'),
      // ),
    );
  }
}


final ThemeData myappTheme = ThemeData(
  navigationBarTheme: NavigationBarThemeData(
    labelTextStyle: MaterialStateProperty.resolveWith((state) {
      if (state.contains(MaterialState.selected)) {
        return const TextStyle(color: Colors.blue, letterSpacing: .5);
      }
      return const TextStyle(color: Colors.black, fontSize: 12);
    }),
  ),
);
