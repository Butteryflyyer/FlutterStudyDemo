import 'package:flutter/material.dart';
import '../common/eventBus.dart';

class childOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return childOneState();
  }
}

class childOneState extends State<childOne> {
  String data = '';

  @override
  void initState() {
    // TODO: implement initState
    eventBus.on<TransEvent>().listen((TransEvent data) => show(data.text));

    super.initState();
  }

  void show(String val) {
    setState(() {
      data = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      decoration: BoxDecoration(color: Colors.blue),
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Container(
              padding: new EdgeInsets.only(bottom: 15),
              child: new Text('子组件1'),
            ),
            new Text('子组件2传过来的值' + '$data')
          ],
        ),
      ),
    );
  }
}
