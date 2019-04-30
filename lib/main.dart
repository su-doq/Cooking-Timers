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
    final wordPair = WordPair.random();
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
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Text(wordPair.runtimeType.toString() + ' - ' + wordPair.asPascalCase)

        ),
      ),
    );
  }
}
