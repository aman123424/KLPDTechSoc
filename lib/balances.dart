
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Balances extends StatelessWidget {
  const Balances({Key? key,required this.balance}) : super(key: key);
  final Map<String, double> balance;
  @override

  Widget build(BuildContext context) {
    print(balance);
    Map<String, double>toBePaid = Map.fromEntries(balance.entries.where((MapEntry e) => e.value <0));
    Map<String, double>toPay = Map.fromEntries(balance.entries.where((MapEntry e) => e.value >0));
    return Scaffold(
      appBar: AppBar(
        title: Text("Balances",style: TextStyle(
          color: Colors.black
        ),),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white24,
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
          children: [
            ListView.builder(
              shrinkWrap: true,
                itemCount: toBePaid.length,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    title: Text("${toBePaid.keys.elementAt(index)} gets back ${toBePaid[toBePaid.keys.elementAt(index)]!*(-1)}"),
                  );
            }),
            ListView.builder(
              shrinkWrap: true,
                itemCount: toPay.length,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    title: Text("${toPay.keys.elementAt(index)} gives ${toPay[toPay.keys.elementAt(index)]}"),
                  );
            }),
          ],
        ),
      )
    );
  }
}
