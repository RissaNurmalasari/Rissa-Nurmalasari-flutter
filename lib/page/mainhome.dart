import 'package:flutter/material.dart';
import 'package:helloworld1/page/long_list.dart';
import 'package:helloworld1/page/petani.dart';
import 'package:helloworld1/page/profile.dart';
import 'package:helloworld1/page/samplepage.dart';
import 'package:helloworld1/page/setting.dart';
// import 'package:my_app/screens/home.dart';
// import 'package:my_app/screens/setting_screen.dart';
// import 'package:my_app/screens/profile_screen.dart';

void main() {
  runApp(const Mymain());
}

class Mymain extends StatelessWidget {
  const Mymain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Screen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const SamplePage(),
    // const home(),
    const SettingScreen(),
    const ProfileScreen(),
    const LongList(),
    const DatasScreen(),
  ];

  final List<String> _appBarTitles = const [
    'Home',
    'Settings',
    'Profile',
    'long_list',
    'petani'
  ]; // List of titles corresponding to each screen

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_selectedIndex]),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'long_list',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: 'Petani',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
