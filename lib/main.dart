import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

void main2() {
  runApp(MyApp());
  print('Two line function');
}

class MyApp extends StatelessWidget {
  @override
  /*

  (Multi-line comment)
  A widget’s main job is to provide a build() method that describes how to display the widget in terms of other, lower level widgets.

   */
  Widget build(BuildContext context) {
    /*
    If the app is running, hot reload to update the running app.
    Each time you click hot reload, or save the project,
    you should see a different word pair, chosen at random, in the running app.
    This is because the word pairing is generated inside the build method,
    which is run each time the MaterialApp requires rendering,
    or when toggling the Platform in Flutter Inspector.
     */
    return MaterialApp(
        title: 'Welcome to Flutter',
        /*
      The app you’ve run so far is in the debug mode which allows faster development
      (e.g., hot reload) at a big performance overhead. Therefore,
      janky animations are expected in such mode. To see how the app performs in release,
      try the following terminal command.

          # cmd
          flutter run --profile

       */
        home: RandomWords());
  }
}

class RandomWordState extends State<RandomWords> {
  // Note: Prefixing an identifier with an underscore enforces privacy in the Dart language.
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('aaaaaa'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
          ],
        ),
        body: _buildSuggestions()); //
  }

  void _pushSaved() {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) {
        final Iterable<ListTile> tiles = _saved.map((WordPair pair) {
          return ListTile(title: Text(pair.asPascalCase, style: _biggerFont));
        });

        final List<Widget> divided =
            ListTile.divideTiles(context: context, tiles: tiles).toList();

        return Scaffold(
          appBar: AppBar(title: Text("APP BAR!")),
          body: ListView(children: divided),
        );
      },
    ));
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2; // <--- modulo
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(pair.asPascalCase, style: _biggerFont),
      trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null),
      onTap: () {
        /*
        Tip: In Flutter's reactive style framework, calling setState() triggers a call to the build() method
         for the State object, resulting in an update to the UI.

         */
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

class RandomWords extends StatefulWidget {
  @override
  RandomWordState createState() => RandomWordState();
}
