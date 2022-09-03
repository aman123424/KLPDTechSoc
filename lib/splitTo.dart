import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'User.dart';

class splitTo extends StatefulWidget {
  const splitTo({Key? key,required this.users}) : super(key: key);
  final List<User> users;
  @override
  _splitToState createState() => _splitToState();
}

class _splitToState extends State<splitTo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adjust Split"),
      ),
      body: Column(
        children: [
          Center(
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child:
              Text("Select which people owe an equal share"),
            )
          ),

          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.users.length,
            itemBuilder: (BuildContext context, int index) {
              return CheckboxListTile(value: value, onChanged: onChanged),
                ListTile(
                leading: const Icon(Icons.list),
                trailing: const Text(
                  "User name",
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
                title: Text("${widget.users[index].name}"),
                onTap: (){},
              );

            },
          ),
        ],
      ),
    );
  }
}
