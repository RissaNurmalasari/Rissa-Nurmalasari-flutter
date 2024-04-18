import 'package:flutter/material.dart';
import 'package:helloworld1/models/chat_model.dart';
import 'package:helloworld1/pages/calls_screen.dart';
import 'package:helloworld1/pages/chat_screen.dart';
import 'package:helloworld1/pages/status_screen.dart';
// import 'package:whatssapp/class/CustomSearchDelegate.dart';
// import 'package:whatssapp/models/MessageSearch.dart';


class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this, initialIndex: 1);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("WhatsApp"),
        elevation: 0.7,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(text: "CHATS"),
            new Tab(text: "STATUS"),
            new Tab(text: "PANGGILAN")
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: MessageSearch());
            },
          ),
          new Padding(padding: const EdgeInsets.symmetric(horizontal: 5.0)),
          new Icon(Icons.more_vert)
        ],
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new ChatsScreen(),
          new StatusScreen(),
          new CallsScreen(),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => ("Open Charts"),
        // backgroundColor: Theme.of(context).accentColor,
        child: new Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
    );
  }
}

class MessageSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
Widget buildResults(BuildContext context) {
  // Implement search functionality here
  List<ChatModel> filteredChats = dummyData.where((chat) {
    return chat.name?.toLowerCase().contains(query.toLowerCase()) ?? false;
  }).toList();
  
  return ListView.builder(
    itemCount: filteredChats.length,
    itemBuilder: (context, index) {
      ChatModel chat = filteredChats[index];
      return ListTile(
       title: Text(chat.name!),
        subtitle: Text(chat.message!),
        leading: CircleAvatar(
          backgroundImage: AssetImage(chat.avatarUrl!),
        ),
        onTap: () {
          // Handle chat item tap
        },
      );
    },
  );
}


  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement search suggestions here
    return Container();
  }
}