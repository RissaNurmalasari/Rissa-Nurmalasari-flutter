import 'package:flutter/material.dart';
import 'package:helloworld1/models/chat_model.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  List<ChatModel> dummyData = [
    // your chat data
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    List<ChatModel> suggestions = _filterChats(query);

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        ChatModel chat = suggestions[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(chat.avatarUrl ?? ''),
          ),
          title: Text(chat.name ?? ''),
          subtitle: Text(chat.message ?? ''),
          trailing: Text(chat.time ?? ''),
        );
      },
    );
  }

  List<ChatModel> _filterChats(String query) {
    return dummyData
        .where((chat) =>
            chat.name!.toLowerCase().contains(query.toLowerCase()) ||
            chat.message!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
  
  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
