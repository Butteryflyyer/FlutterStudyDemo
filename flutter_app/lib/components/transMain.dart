import 'package:flutter/material.dart';
import './parent.dart';

void main() => runApp(new transApp());

class transApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'trans demo',
      theme: new ThemeData(primarySwatch: Colors.grey),
      home: new MyHomePage(title: 'flutter trans home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomePageSate();
  }
}

class MyHomePageSate extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text(widget.title)),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[new Parent()],
        ),
      ),
    );
  }
}
