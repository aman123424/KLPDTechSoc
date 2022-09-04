import 'package:flutter/material.dart';
import 'package:techsoc_comp/User.dart';
import 'package:techsoc_comp/addMember.dart';


class GroupDetails extends StatefulWidget {
  const GroupDetails({Key? key, required this.members}) : super(key: key);
  final List<User> members;

  @override
  State<GroupDetails> createState() => _GroupDetailsState();
}

class _GroupDetailsState extends State<GroupDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Group Members",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white24,
        elevation: 0.0,
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
        child: Column(
          mainAxisAlignment: widget.members.isEmpty? MainAxisAlignment.center : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if(widget.members.isEmpty)
              Center(child: Text("Please add a group")),

            if(widget.members.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.members.length,
                  itemBuilder: (BuildContext context, int index) {
                    return
                      // CheckboxListTile(value: value, onChanged: onChanged),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: ListTile(
                          leading: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: index%2 == 0 ?
                                        [
                                          Color(0xFF8F1A00),
                                          Color(0xFFEF4D2A),
                                        ]
                                            :
                                        [
                                          Color(0xFF166A00),
                                          Color(0xFF46D91F)
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight
                                    ),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Icon(
                                  Icons.group,
                                  color: Colors.white,
                                )
                            ),
                          ),
                          title: Text(widget.members[index].name),
                          onTap: () {
                          },
                          onLongPress: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Delete ${widget.members[index].name}"),
                                content: Text("Are you sure you want to delete ${widget.members[index].name}"),
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
                                            widget.members.removeAt(index);
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
                        ),
                      );

                  },
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width*0.45,
        height: 50,
        child: ElevatedButton(
          onPressed: () async{
            dynamic result = await Navigator.push(context, MaterialPageRoute(builder: (context)=> AddMember()));
            setState(() {
              widget.members.add(result);
            });
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.person_add),
              Text("Add Member"),
            ],
          ),
        ),
      ),
    );
  }
}
