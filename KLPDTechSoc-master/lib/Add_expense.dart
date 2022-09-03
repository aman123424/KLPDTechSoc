import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techsoc_comp/PaidBy.dart';
import 'package:techsoc_comp/splitTo.dart';
import 'User.dart';

class addExpense extends StatefulWidget {
  const addExpense({Key? key}) : super(key: key);

  @override
  _addExpenseState createState() => _addExpenseState();
}

class _addExpenseState extends State<addExpense> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Expense"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.fromLTRB(
                    10.0, 10.0, 5.0, 2.0),
                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(100.0),
                ),
                hintText: 'Enter a description',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  setState(() {

                  });
                }
                return null;
              },
            ),
            TextFormField(
              controller: amountController,
              decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.fromLTRB(
                    10.0, 10.0, 5.0, 2.0),
                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(100.0),
                ),
                hintText: 'Enter Amount',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  setState(() {

                  });
                }
                return null;
              },
            ),
            Row(
              children: [
                Text("Paid By"),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>paidBy(users: [User(name: "Gregrary")],)));
                },
                    child: Text(
                      "You",
                ),),
                Text("Split"),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>splitTo(users: [User(name: "Gregrary")],)));
                },
                    child: Text(
                      "Equally",
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
