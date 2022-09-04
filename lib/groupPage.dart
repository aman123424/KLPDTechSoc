import 'package:flutter/material.dart';
import 'package:techsoc_comp/balances.dart';
import 'package:techsoc_comp/expenseClass.dart';
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
  void initState() {
    // TODO: implement initState
    balance();
    super.initState();
  }
  void balance(){
    setState(() {
      balances = {for (var k in widget.group.members) k.name : 0};
    });
  }
  Map<String, double> balances = { };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.group.name),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Balances(balance: balances)));
              },
              child: Text("Balances"),
          ),
          if (widget.group.expenses.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.group.expenses.length,
              itemBuilder: (BuildContext context, int index){
              return ListTile(
                leading: const Icon(Icons.list),
                subtitle: Text("${widget.group.expenses[index].paidBy.name} paid ₹${widget.group.expenses[index].amount}"),
                title: Text(widget.group.expenses[index].description),
            );
          }
          ),
          if(widget.group.expenses.isEmpty)
            Center(
              child: Text("No Expenses"),
            )
        ],
      ),
      floatingActionButton:
           FloatingActionButton(
            onPressed: () async{
              dynamic result = await Navigator.push(context, MaterialPageRoute(builder: (context)=> addExpense(users: widget.group.members) ));
              List<User> splitTo = result.splitTo;
              int amount = result.amount;
              print(splitTo);
              print(splitTo.length);
              setState((){
                widget.group.expenses.add(expense(splitTo: splitTo, paidBy: result.paidBy, description: result.description, amount: amount));
                for(int i=0;i<splitTo.length;i++){
                  balances[splitTo[i].name] = balances[splitTo[i].name]! + amount/splitTo.length;
                }
                balances[result.paidBy.name] = balances[result.paidBy.name]! - amount;
              });
              print(balances);
            },
          ),
      );
  }
}
