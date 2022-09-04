import 'package:flutter/material.dart';
import 'package:techsoc_comp/User.dart';
import 'package:techsoc_comp/add_group.dart';
import 'package:techsoc_comp/Group.dart';
import 'package:techsoc_comp/groupPage.dart';

import 'Add_expense.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Split', users: [],),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.users}) : super(key: key);


  final String title;
  final List<User> users ;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Group> groups = [Group(name: "KLPD", size: "7", members: []), Group(name: "Alak", size: "5", members: [])];

  @override
  Widget build(BuildContext context) {
    print(groups.length);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.title,
          style: TextStyle(
            color: Colors.black
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white24,
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(
            color: Colors.black,
            width: 0.5,
            style: BorderStyle.solid
          ))
        ),
        child: Column(
          mainAxisAlignment: groups.isEmpty? MainAxisAlignment.center : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if(groups.isEmpty)
              Center(child: Text("Please add a group")),

            if(groups.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: groups.length,
                  itemBuilder: (BuildContext context, int index) {
                    return
                      // CheckboxListTile(value: value, onChanged: onChanged),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          child: ListTile(
                            leading: AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: index%2 == 0 ?
                                      [
                                        Color(0xFF8F1A00),
                                        Color(0xFFEF4D2A),
                                      ]
                                          :
                                      [
                                        Color(0xFF166A00),
                                        Color(0xFF46D91F)
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight
                                    ),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Icon(
                                      Icons.group,
                                    color: Colors.white,
                                  )
                              ),
                            ),
                            trailing: Text(
                              groups[index].size,
                              style: TextStyle(color: Colors.green, fontSize: 15),
                            ),
                            title: Text(groups[index].name),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => groupPage(group: groups[index])));
                            },
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text("Delete Group"),
                                  content: Text("Are you sure you want to delete ${groups[index].name}"),
                                  actions: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(14),
                                            child: const Text("Cancel"),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              groups.removeAt(index);
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(14),
                                            child: const Text("Delete"),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );

                  },
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width*0.45,
        height: 50,
        child: ElevatedButton(
          onPressed: () async{
            dynamic result = await Navigator.push(context, MaterialPageRoute(builder: (context)=> AddGroup(groups: groups,)));
            setState(() {
              groups.add(result);
            });
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.group_add_outlined),
              Text("Add Group"),
            ],
          ),
        ),
      ),
    );
  }
}
