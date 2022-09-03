import 'package:flutter/material.dart';
import 'Add_expense.dart';
import 'Group.dart';
import 'User.dart';

class groupPage extends StatefulWidget {
  const groupPage({Key? key ,required this.group}) : super(key: key);
  final Group group;


  @override
  _groupPageState createState() => _groupPageState();
}

class _groupPageState extends State<groupPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, int> balances = { for (var k in widget.group.members) k.name : 0 };
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.group.name),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: (){},
              child: Text("Balances"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          dynamic result = await Navigator.push(context, MaterialPageRoute(builder: (context)=> addExpense(users: [User(name: "Gregrary"),User(name: "Toofar")]) ));
          List<User> splitTo = result.splitTo;
          int amount = result.amount;
          print(splitTo);
          print(splitTo.length);

          for(int i=0;i<splitTo.length;i++){
            balances[splitTo[i].name] = balances[splitTo[i].name]! + amount/splitTo.length as int;
          }
          balances[result.paidBy.name] = balances[result.paidBy.name]! - amount;
          print(balances);

        },
      ),

      );
  }
}
