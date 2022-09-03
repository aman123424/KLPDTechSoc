import 'package:flutter/material.dart';
import 'package:techsoc_comp/Add_expense.dart';
import 'package:techsoc_comp/User.dart';
import 'package:techsoc_comp/add_group.dart';
import 'package:techsoc_comp/Group.dart';

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

        primarySwatch: Colors.blue,
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

  List<Group> groups = [];

  @override
  Widget build(BuildContext context) {
    print(groups.length);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: groups.isEmpty? MainAxisAlignment.center : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if(groups.isEmpty)
            Center(child: Text("Please add a group")),

          if(groups.isNotEmpty)
            ListView.builder(
              shrinkWrap: true,
              itemCount: groups.length,
              itemBuilder: (BuildContext context, int index) {
                return
                  // CheckboxListTile(value: value, onChanged: onChanged),
                  ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                        ),
                        child: Icon(
                            Icons.group)
                    ),
                    trailing: Text(
                      groups[index].size,
                      style: TextStyle(color: Colors.green, fontSize: 15),
                    ),
                    title: Text(groups[index].name),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => addExpense(users: [],)));
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
                  );

              },
            ),
        ],
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
