import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'User.dart';

class paidBy extends StatefulWidget {
  const paidBy({Key? key, required this.users}) : super(key: key);
  final List<User> users;
  @override
  _paidByState createState() => _paidByState();
}

class _paidByState extends State<paidBy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Who paid?"
        ),
      ),
      body: ListView.builder(
        itemCount: widget.users.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              leading: const Icon(Icons.list),
              trailing: const Text(
                "User name",
                style: TextStyle(color: Colors.green, fontSize: 15),
              ),
              title: Text("${widget.users[index].name}"),
              onTap: (){
                Navigator.pop(context,widget.users[index]);
              },
          );

        },
      ),
    );
  }
}
