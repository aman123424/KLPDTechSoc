import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'User.dart';

class splitTo extends StatefulWidget {
  const splitTo({Key? key,required this.checkboxList}) : super(key: key);
  final List<CheckBoxListTileModel> checkboxList;

  @override
  _splitToState createState() => _splitToState();
}

class _splitToState extends State<splitTo> {

  @override
  Widget build(BuildContext context) {
    List<CheckBoxListTileModel>checkboxList = widget.checkboxList;
    late List<User> selectedUsers = [];
    return Scaffold(
      appBar: AppBar(
        title: Text("Adjust Split"),
      ),
      body: Column(
        children: [
          Center(
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child:
              Text("Select which people owe an equal share"),
            )
          ),

          ListView.builder(
            shrinkWrap: true,
            itemCount: checkboxList.length,
            itemBuilder: (BuildContext context, int index) {
              return StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return CheckboxListTile(
                      title: Text(checkboxList[index].name),
                      value: checkboxList[index].isCheck,
                      selected: checkboxList[index].isCheck,
                      activeColor: Colors.green,
                      checkColor: Colors.white,
                      onChanged: (value) {
                      setState(() {
                        print("set state");
                      checkboxList[index].isCheck = value!;
                    });
                  },
                  );
                }
              );
            },
          ),
          ElevatedButton(onPressed: (){
            for (int i = 0 ;i<checkboxList.length;i++){
              if (checkboxList[i].isCheck){
                 selectedUsers.add(User(name: checkboxList[i].name));
              }
            }
            Navigator.pop(context,{
              selectedUsers,
            });
          }, child: Text("Submit"))
        ],
      ),
    );
  }
}

class CheckBoxListTileModel {
  String name;
  bool isCheck;

  CheckBoxListTileModel({required this.name, required this.isCheck});
}