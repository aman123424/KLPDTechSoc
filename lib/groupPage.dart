import 'package:flutter/material.dart';
import 'package:techsoc_comp/balances.dart';
import 'package:techsoc_comp/expenseClass.dart';
import 'Add_expense.dart';
import 'Group.dart';
import 'User.dart';
import 'package:techsoc_comp/groupDetails.dart';

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
        title: Text(widget.group.name,style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white24,
        elevation: 0.0,
        actions: [
          IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => GroupDetails(members: widget.group.members,)));}, icon: Icon(Icons.group))
        ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(
            color: Colors.black,
            width: 0.5,
            style: BorderStyle.solid
          ))
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Balances(balance: balances)));
                  },
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Colors.black,
                      width: 0.5,
                      style: BorderStyle.solid
                    )
                  )
                ),
                  child: Text("Balances",style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),),
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
                  child: Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.35),
                    child: Text("No Expenses",style:TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500
                    ),),
                  ),
                )
            ],
          ),
        ),
      ),
      floatingActionButton:
           Container(
             width: MediaQuery.of(context).size.width*0.45,
             height: 50,
             child: ElevatedButton(
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
               style: ElevatedButton.styleFrom(
                   primary: Colors.grey[400],
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(50),
                       side: BorderSide(
                           color: Colors.black,
                           width: 0.5,
                           style: BorderStyle.solid
                       )
                   )
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: const [
                   Icon(Icons.monetization_on_outlined,color: Colors.black,),
                   Text("Add Expenses",style: TextStyle(color: Colors.black),),
                 ],
               ),
          ),
           ),
      );
  }
}
