import 'package:flutter/material.dart';
import './components/RouterOne.dart';

void main() {
  runApp(flutterApp());
}

class flutterApp extends StatelessWidget {
  flutterApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'fluttertest',
      home: flutterWidget(),
      routes: <String, WidgetBuilder>{
        // ignore: not_enough_required_arguments, not_enough_required_arguments
        '/routerOne': (BuildContext context) => new RouterOne('')
      },
    );
  }
}

class flutterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return flutterWidgetState();
  }
}

class flutterWidgetState extends State<flutterWidget> {
  String _backData = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('flutterApp'),
      ),
      body: _bodyListBuild(context),
    );
  }

//简单
  Widget _bodyBuild(context) {
    return new Container(
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.only(left: 50),
      child: new Column(
        children: <Widget>[
          new Text(
            '111',
            textAlign: TextAlign.center,
            style: new TextStyle(
              color: Colors.red,
              fontSize: 20,
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(top: 50),
            child: new Text('222'),
          )
        ],
      ),
    );
  }

  //列表
  Widget _bodyListBuild(context) {
    return new ListView.builder(
        itemBuilder: (context, int index) => _listItemCustom(index.toString()));
  }

  void _tapclick(index) {
    print(index);
  }

  Widget _listItem(index) {
    return new ListTile(
        title: new Text(index),
        subtitle: new Text('subtitle'),
        trailing: new Text('trainling'),
        onTap: (() => _tapclick(index)));
  }

  void _btnRouterClick() {
//     Navigator.of(context).pushNamed('/routerOne');

//  Navigator.of(context).push(new MaterialPageRoute(builder: (context){
//    return new RouterOne('xinhao test');
//  }));

    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) =>
                new RouterOne('xinhao test'))).then((data) {
              setState(() {
                _backData = data;
              });
    });
  }

  Widget _listItemCustom(index) {
    return new Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
//         verticalDirection: ,
        children: <Widget>[
          new Padding(padding: const EdgeInsets.only(left: 50)),
          new Text(index),
          new Text(_backData),
          new Padding(padding: const EdgeInsets.only(left: 100)),
          new Icon(Icons.title),
          new RaisedButton(onPressed: () => _btnRouterClick())
        ],
      ),
    );
  }
}
