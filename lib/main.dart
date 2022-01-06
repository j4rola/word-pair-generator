import 'package:flutter/material.dart';
import './random_words.dart';

void main() => runApp(const MyApp()); //Entry point

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  //This override decorator is used to show that we are overriding the built
  // in build function from the StatelessWidget class that the MyApp class is
  // extending

  Widget build(BuildContext context) {
    return MaterialApp(
        /*The Scaffold widget is the main wrapper for the UI. Every other UI element is a child 
        of this widget */
        home: RandomWords());
  }
}
