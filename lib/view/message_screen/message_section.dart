import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_clone_app/utils/constants/color_constant.dart';

void main() => runApp(MessageSection());

class MessageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MessagingScreen(),
    );
  }
}

class MessagingScreen extends StatelessWidget {
  final List<Map<String, String>> messages = [
    {
      'title': 'Killadi mon',
      'subtitle': '100 ruupa kadam undaa...',
      'time': '1:29 PM'
    },
    {'title': 'Antappan', 'subtitle': 'ye boi evdeen?', 'time': '25 Feb'},
  ];

  final List<Map<String, String>> contacts = [
    {'name': 'Erin', 'handle': '@Erinnannan'},
    {'name': 'Abhay Jayan', 'handle': '@vyshaksyks'},
    {'name': 'Abhinave Kš', 'handle': '@abhinaveks77'},
    {'name': 'Akshay Râfêl', 'handle': '@akshayrapheal1'},
    {'name': 'Amal Np', 'handle': '@amalnp3'},
    {'name': 'Antony Noel', 'handle': '@ajoel0498'},
    {'name': 'Antony Ralbin', 'handle': '@antonyralbin'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.black,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: ColorConstant.primaryColor,
                  child: Icon(CupertinoIcons.create),
                  // Replace with your image
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'New messages',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),

          // Messages Section
          ListTile(
            title: Text('Messages'),
          ),
          ...messages.map((message) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: ColorConstant.lightGrey,
                child: Text(message['title']![0]),
              ),
              title: Text(message['title']!),
              subtitle: Text(message['subtitle']!),
              trailing: Text(message['time']!),
            );
          }).toList(),
          SizedBox(
            height: 16,
          ),
          // Contacts Section
          ListTile(
            title: Text('Contacts'),
          ),
          ...contacts.map((contact) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: ColorConstant.lightGrey,
                backgroundImage: contact['name'] == 'Erin'
                    ? AssetImage('assets/image/c.jpeg')
                    : null,
                child: contact['name'] == 'Erin'
                    ? null
                    : Text(contact['name']![0]),
              ),
              title: Text(contact['name']!),
              subtitle: Text(contact['handle']!),
              trailing: Icon(Icons.arrow_forward_ios),
            );
          }).toList(),
        ],
      ),
    );
  }
}
