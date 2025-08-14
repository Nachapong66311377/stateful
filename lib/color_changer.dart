import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ColorChanger(),
    );
  }
}

class ColorChanger extends StatefulWidget {
  const ColorChanger({super.key});

  @override
  State<ColorChanger> createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {
  late Color _currentColor;
  final List<Color> _colors = [Colors.red,Colors.green,Colors.yellow,Colors.purple,Colors.orange,Colors.teal,];
  final Random _random = Random();
  
  @override
  void initState(){
    super.initState();
    _currentColor = Colors.blue;
  }

  void _changeColor() {
    setState(() {
      _currentColor = _colors[_random.nextInt(_colors.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: _currentColor, 
        alignment: Alignment.center,
        child: Text('Tap Me'),
      ),
    );
  }
}
