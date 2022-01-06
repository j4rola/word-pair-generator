import 'package:flutter/material.dart';
/*In Dart, we can just import a file and reference elements that belong to it
as if they existed in the current file. For example, because we have imported
the 'english_words.dart*/
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _RandomWordPairs = <WordPair>[];
  final _savedWordPairs = Set<WordPair>();
  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, item) {
        if (item.isOdd) return Divider();

        final index = item ~/ 2;

        if (index >= _RandomWordPairs.length) {
          _RandomWordPairs.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_RandomWordPairs[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final _alreadySaved = _savedWordPairs.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: TextStyle(fontSize: 18),
      ),
      trailing: Icon(_alreadySaved ? Icons.favorite : Icons.favorite_border),
      onTap: () {
        setState(() {
          if (_alreadySaved) {
            _savedWordPairs.remove(pair);
          } else {
            _savedWordPairs.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _savedWordPairs.map((WordPair pair) {
        return ListTile(
            title: Text(pair.asPascalCase, style: TextStyle(fontSize: 16)));
      });
      final List<Widget> divided =
          ListTile.divideTiles(tiles: tiles, context: context).toList();

      return Scaffold(
        appBar: AppBar(
            title: Text('Favorites'), backgroundColor: Colors.green.shade900),
        body: ListView(
          children: divided,
        ),
      );
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WordPair Generator'),
          backgroundColor: Colors.green.shade900,
          actions: <Widget>[
            IconButton(onPressed: _pushSaved, icon: Icon(Icons.list))
          ],
        ),
        body: _buildList());
  }
}
