
import 'package:flutter/material.dart';

class RouterOne extends StatefulWidget {

  RouterOne(this.title);
  String title;
  @override
  _RouterOneState createState() => new _RouterOneState();
}

class _RouterOneState extends State<RouterOne> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: new Text("demo1"),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Text(widget.title),
            new RaisedButton(onPressed: (){
                Navigator.of(context).pop('xinhao');

//            Navigator.of(context).popAndPushNamed('/routerOne');

            })
          ],
        ),
      ),
    );
  }
}
