import 'package:flutter/material.dart';
import 'package:techsoc_comp/Group.dart';


class AddGroup extends StatefulWidget {
  const AddGroup({Key? key, required this.groups}) : super(key: key);
  final List<Group> groups;

  @override
  State<AddGroup> createState() => _AddGroupState();
}

class _AddGroupState extends State<AddGroup> {

  TextEditingController nameController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  final groupFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Group"),
      ),
      body: Form(
        key: groupFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.fromLTRB(
                    10.0, 10.0, 5.0, 2.0),
                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(100.0),
                ),
                hintText: 'Enter group name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter the group name";
                }
                return null;
              },
            ),

            TextFormField(
              controller: sizeController,
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
                      if(groupFormKey.currentState!.validate()){
                        Navigator.pop(context,Group(name: nameController.text, size: sizeController.text, members: []));
                      }
                    },
                    child: Text("Add")
                )
            )
          ],
        ),
      )
    );
  }
}
