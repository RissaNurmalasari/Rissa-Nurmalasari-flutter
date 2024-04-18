import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3, // Ubah jumlah panggilan sesuai kebutuhan
      itemBuilder: (context, index) {
        // Panggilan terjawab
        if (index == 0) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('images/nabila.jpg'),
            ),
            title: Text('Mancani Nabilla'),
            subtitle: Text('Today, 5:23 PM'),
            trailing: Icon(
              Icons.call_received,
              color: Colors.green,
            ),
          );
        }
        // Panggilan tidak terjawab
        else if (index == 1) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('images/aa.jpg'),
            ),
            title: Text('Aljun Nurahman'),
            subtitle: Text('Yesterday, 5:00 PM'),
            trailing: Icon(
              Icons.call_missed,
              color: Colors.red,
            ),
          );
        }

         else if (index == 2) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('images/danan.jpg'),
            ),
            title: Text('I Gede Dhananjaya'),
            subtitle: Text('Yesterday, 2:00 PM'),
            trailing: Icon(
              Icons.call_missed,
              color: Colors.red,
            ),
          );
        }
        // Panggilan lainnya
        else if (index == 3) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('images/nabila.jpg'),
            ),
            title: Text('Mancani Nabilla'),
            subtitle: Text('Yesterday, 10:00 AM'),
            trailing: Icon(
              Icons.call_received,
              color: Colors.green,
            ),
          );
        }
        return SizedBox.shrink(); // Jika jumlah panggilan lebih dari 3, gunakan SizedBox.shrink() untuk item yang tidak terlihat
      },
    );
  }
}
