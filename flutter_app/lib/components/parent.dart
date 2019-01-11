import 'package:flutter/material.dart';
import 'childOne.dart';
import 'childTwo.dart';

class Parent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ParentState();
  }
}

class ParentState extends State<Parent> {
  String data = "无";
  String dataTwo = "传递给组件2的值";

  void onChanged(val){
    setState(() {
      data = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            width: 400,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(top: 30, bottom: 50),
            decoration: BoxDecoration(color: Colors.blue[100]),
            child: new Column(
              children: <Widget>[
                new childOne(),
                new childTwo(dataTwo: dataTwo,callBack: (value)=>onChanged(value)),
                new Container(
                  padding: new EdgeInsets.only(bottom: 15),
                  child: new Text('父组件'),
                ),
                new Text('子组件2，传过来的值' + '$data'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
