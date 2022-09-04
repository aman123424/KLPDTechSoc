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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Expense",style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white24,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pop(context,expense(splitTo: splitto, paidBy: paidby, description: descriptionController.text,amount: int.parse(amountController.text)));
              },
              icon: Icon(Icons.done,color: Colors.black,)
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(
            color: Colors.black,
            style: BorderStyle.solid,
            width: 0.5
          ))
        ),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.fromLTRB(20,height*0.15,20,0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.black, style: BorderStyle.solid, width: 0.5)
                      ),
                      child: Icon(Icons.description,size: 30,),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      width: width*0.7,
                      child: TextFormField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.fromLTRB(
                              0, 10.0, 5.0, 0),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 1.0)
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
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(5),
                            shape: BoxShape.rectangle,
                            border: Border.all(color: Colors.black, style: BorderStyle.solid, width: 0.5)
                        ),
                        child: Icon(Icons.attach_money,size: 30),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        width: width*0.7,
                        child: TextFormField(
                          controller: amountController,
                          decoration: InputDecoration(
                            contentPadding:
                            const EdgeInsets.fromLTRB(
                                0, 10.0, 5.0, 2.0),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 1.0)
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
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Paid By",style: TextStyle(fontSize: 20),),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15,0,15,0),
                      child: ElevatedButton(
                        onPressed: ()async{
                          dynamic result = await Navigator.push(context, MaterialPageRoute(builder: (context)=>paidBy(users: widget.users)));
                          paidby = result;
                          },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[400],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(color: Colors.black, width: 0.5, style: BorderStyle.solid)
                          ),
                        ),
                        child: Text(
                          "You",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                    ),
                    Text("Split",style: TextStyle(fontSize: 20),),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15,0,15,0),
                      child: ElevatedButton(
                          onPressed: ()async{
                            dynamic  result = await Navigator.push(context, MaterialPageRoute(builder: (context)=>splitTo(checkboxList: checkboxList,)));
                            print(result);
                            splitto = result;
                            },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey[400],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(color: Colors.black, width: 0.5, style: BorderStyle.solid)
                            ),
                          ),
                          child: Text(
                            "Equally",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 18
                            ),
                      )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
