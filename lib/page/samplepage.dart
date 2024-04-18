import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:helloworld1/page/profile.dart';
import 'package:helloworld1/page/setting.dart';

class SamplePage extends StatefulWidget {
const SamplePage({super.key});
  


  

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              child: Image(image: AssetImage("images/apaya.jpg"))
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Pantai Pangandaran'),
              Icon(
                Icons.star,
                color: Colors.red[500],
              ),
              const Text('5'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(
                Icons.call,
              ),
              Icon(
                Icons.send,
              ),
              Icon(
                Icons.share,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[Text('Call'), Text('Route'), Text('Share')],
          ),
          Container(
            child: Text(
                'Pantai Pangandaran adalah objek wisata yang terkenal di Jawa Barat, Indonesia.'
                'Terletak di sebelah tenggara Jawa Barat, pantai ini menawarkan keindahan pasir hitam dan pasir putih yang memukau. '
                'Pantai Pangandaran terkenal karena keindahan alamnya dan berada di sekitar area Cagar Alam Pananjung.'
                'Pantai ini pernah dinobatkan sebagai pantai terbaik di provinsi Jawa Barat oleh AsiaRooms. '
                'Selain itu, Pantai Pangandaran juga dikenal sebagai Kota Nelayan Kecil karena sebagian besar mata pencaharian masyarakat setempat adalah sebagai nelayan'
                ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'), trailing: new Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Profile'),
              trailing: new Icon(Icons.person),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfileScreen()));
              },
            ),
            ListTile(
              title: const Text('Long List'), trailing: new Icon(Icons.list),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              height: 2,
            ),
            ListTile(
              title: const Text('Setting'), trailing: new Icon(Icons.settings),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const SettingScreen()));
              },
            ),
          ],
        ),
     ),
    );
}
}
