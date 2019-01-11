import 'package:flutter/material.dart';
import '../common/eventBus.dart';
import 'dart:async';
class childTwo extends StatefulWidget {
  childTwo({Key key, this.dataTwo, this.callBack}) : super(key: key);
  final callBack;
  String dataTwo;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new childTwoState();
  }
}
class childTwoState extends State<childTwo>{
  String data = '';
  StreamSubscription subscription;
  String inputText;
  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    data = widget.dataTwo;
    super.initState();
  }

  void _onChanged(String value){
    setState(() {
      inputText = value;
    });
  }
  void transA(){
    widget.callBack('$inputText');
  }
  void transB(){
    eventBus.fire(new TransEvent('$inputText'));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(top: 30,bottom: 50),
      decoration: BoxDecoration(
        color:Colors.blue[100]
      ),
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Container(
              padding: new EdgeInsets.only(bottom: 15),
              child: new Text('子组件2'),
            ),
            new Container(
              padding: new EdgeInsets.only(bottom: 20),
              child: new Text('父传字'+data),
            ),
            new Container(
              margin: new EdgeInsets.only(bottom: 40),
              child: new TextField(
                controller: controller,
                decoration: (new InputDecoration(labelText: '请输入你要发送的值')),
                onChanged: _onChanged,
              ),
            ),
            new Container(
              child: new RaisedButton(onPressed: transA,child: new Text('to 父组件')),
            ),
            new Container(
              child: new RaisedButton(onPressed: transB,child: new Text('to 兄弟组件')),
            )
          ],
        ),
      ),
    );
  }
}