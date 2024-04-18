import 'package:flutter/material.dart';

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}



class _StatusScreenState extends State<StatusScreen> {
  final List<String?> _statuses = [
    'Status 1',
    'Status 2',
    'Status 3',
  ];

  void _addStatus() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String? newStatus;
        return AlertDialog(
          title: Text('Add a new status'),
          content: TextField(
            onChanged: (value) {
              newStatus = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('ADD'),
              onPressed: () {
                if (newStatus != null && newStatus!.isNotEmpty) {
                  setState(() {
                    _statuses.add(newStatus);
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
            TextButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  void _deleteStatus(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete status'),
          content: Text('Are you sure you want to delete this status?'),
          actions: <Widget>[
            TextButton(
              child: Text('YES'),
              onPressed: () {
                setState(() {
                  _statuses.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('NO'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Status'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addStatus,
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: _statuses.length,
        itemBuilder: (BuildContext context, int index) {
          final status = _statuses[index];
          return ListTile(
            title: Text(status ?? ''),
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _deleteStatus(index);
              },
            ),
            onLongPress: () {
              _deleteStatus(index);
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }
}