import 'package:flutter/material.dart';
import 'package:flutter_app/strings.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: Strings.appTitle,
      theme: new ThemeData(
        primaryColor: Colors.white
      ),
      home: new Randomwords()

    );
  }
}

class Randomwords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomwordsState();
  }
}

class RandomwordsState extends State<Randomwords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('start up appbar'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
          new IconButton(icon: new Icon(Icons.add), onPressed: _pushSaved),
          new IconButton(icon: new Icon(Icons.create), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggeststions(),
    );
  }

  void _pushSaved() {
    print("test");

    Navigator.of(context).push(new MaterialPageRoute(
      builder: (context) {
        final tiles = _saved.map(
          (pair) {
            return new ListTile(
              title: new Text(
                pair.asPascalCase,
                style: _biggerFont,
              ),
            );
          },
        );
        final divided =
            ListTile.divideTiles(tiles: tiles, context: context).toList();
        return new Scaffold(
          appBar: new AppBar(
            title: new Text('收藏夹'),
          ),
          body: new ListView(children: divided),
        );
      },
    ));
  }

  Widget _buildSuggeststions() {
    return new ListView.builder(
        padding: EdgeInsets.all(10.0),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
