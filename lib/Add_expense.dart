import 'package:flutter/material.dart';
import 'package:techsoc_comp/PaidBy.dart';
import 'package:techsoc_comp/expenseClass.dart';
import 'package:techsoc_comp/splitTo.dart';

import 'User.dart';

class addExpense extends StatefulWidget {
  const addExpense({Key? key,required this.users}) : super(key: key);
  final List<User> users;
  @override
  _addExpenseState createState() => _addExpenseState();
}

class _addExpenseState extends State<addExpense> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    List<CheckBoxListTileModel> checkboxList = widget.users.map((x) => CheckBoxListTileModel(name: x.name, isCheck: true) ).toList();
    User paidby = User(name: "YOU");
    List<User> splitto = widget.users;
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
                ElevatedButton(onPressed: ()async{
                      dynamic result = await Navigator.push(context, MaterialPageRoute(builder: (context)=>paidBy(users: widget.users)));
                      paidby = result;
                    },
                        child: Text(
                          "You",
                    ),
                ),
                Text("Split"),
                ElevatedButton(onPressed: ()async{
                  dynamic  result = await Navigator.push(context, MaterialPageRoute(builder: (context)=>splitTo(checkboxList: checkboxList,)));
                  print(result);
                  splitto = result;
                },
                    child: Text(
                      "Equally",
                )),
              ],
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context,expense(splitTo: splitto, paidBy: paidby, description: descriptionController.text,amount: int.parse(amountController.text)));
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
