import 'package:flutter/material.dart';
import 'package:techsoc_comp/User.dart';

class AddMember extends StatefulWidget {
  const AddMember({Key? key}) : super(key: key);

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {

  TextEditingController nameController = TextEditingController();
  final memberFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Member",style: TextStyle(color: Colors.black),),
        elevation: 0.0,
        backgroundColor: Colors.white24,
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
        child: Form(
          key: memberFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding:
                  const EdgeInsets.fromLTRB(
                      10.0, 10.0, 5.0, 2.0),
                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(100.0),
                  ),
                  hintText: 'Enter group size',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the group size";
                  }
                  return null;
                },
              ),

              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        if(memberFormKey.currentState!.validate()){
                          Navigator.pop(context,User(name: nameController.text));
                        }
                      },
                      child: Text("Add")
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
