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
//          The Scaffold widget, from the Material library, provides a default app bar, title,
//          and a body property that holds the widget tree for the home screen. The widget subtree can be quite complex.
      home: Scaffold(
        body: Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}

class RandomWordState extends State<RandomWords> {
  // Note: Prefixing an identifier with an underscore enforces privacy in the Dart language.
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordState createState() => RandomWordState();
}
