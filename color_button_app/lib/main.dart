import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coloring Button App',
      theme: new ThemeData(
        // primarySwatch: Color(0XFF1ABC9C),
        primaryColor: const Color(0XFF1ABC9C),
        accentColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text(
          'Coloring Button App',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              new SizedBox(
                height: 48,
                child: new ButtonStatelessWidget(),
              ),
              const SizedBox(
                height: 16,
              ),
              new SizedBox(
                height: 48,
                child: new ButtonStatefulWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonStatelessWidget extends StatelessWidget {
  final List colors = [
    Color(0XFF1ABC9C),
    Colors.red,
    Colors.blue,
    Colors.grey,
    Colors.indigo
  ];

  int index = 0;

  final Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      child: const Text('Stateless Widget',
          style: const TextStyle(
            color: const Color(0XFF1ABC9C),
            fontSize: 24,
          )),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(24),
          side: const BorderSide(
            color: const Color(0XFF1ABC9C),
            width: 2,
          )),
      color: Colors.white,
      onPressed: () {
        index = random.nextInt(colors.length);
        print('Stateless => index: ' + index.toString());
      },
    );
  }
}

class ButtonStatefulWidget extends StatefulWidget {
  @override
  _ButtonStatefulWidgetState createState() => _ButtonStatefulWidgetState();
}

class _ButtonStatefulWidgetState extends State<ButtonStatefulWidget> {
  final List _colors = [
    Color(0XFF1ABC9C),
    Colors.red,
    Colors.blue,
    Colors.grey,
    Colors.indigo
  ];

  final Random _random = new Random();

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      child: const Text('Stateful Widget',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          )),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(24),
          side: new BorderSide(
            color: _colors[_index],
            width: 2,
          )),
      color: _colors[_index],
      onPressed: () {
        setState(() => _index = _random.nextInt(_colors.length));
        print('Stateful => index: ' + _index.toString());
      },
    );
  }
}
