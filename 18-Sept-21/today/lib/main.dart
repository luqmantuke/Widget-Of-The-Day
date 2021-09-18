// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  bool selected = false;
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: Center(
              child: AnimatedContainer(
                width: selected ? 200.0 : 100.0,
                height: selected ? 100.0 : 200.0,
                color: selected ? Colors.red : Colors.blue,
                alignment: selected
                    ? Alignment.center
                    : AlignmentDirectional.topCenter,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: const FlutterLogo(size: 75),
              ),
            ),
          ),
          AnimatedCrossFade(
            duration: const Duration(seconds: 3),
            firstChild: const FlutterLogo(
                style: FlutterLogoStyle.horizontal, size: 100.0),
            secondChild:
                const FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
            crossFadeState:
                selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          ),
          AnimatedDefaultTextStyle(
            child: Text("Flutter"),
            duration: Duration(seconds: 3),
            style: TextStyle(
                color: selected ? Colors.blue : Colors.black,
                fontSize: selected ? 25 : 16),
            curve: Curves.bounceInOut,
            textAlign: TextAlign.center,
          ),
          AnimatedOpacity(
            opacity: opacityLevel,
            duration: const Duration(seconds: 3),
            child: const FlutterLogo(),
          ),
          ElevatedButton(
            child: const Text('Fade Logo'),
            onPressed: _changeOpacity,
          ),
          SizedBox(
            width: 200,
            height: 350,
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  width: selected ? 200.0 : 50.0,
                  height: selected ? 50.0 : 200.0,
                  top: selected ? 50.0 : 150.0,
                  duration: const Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = !selected;
                      });
                    },
                    child: Container(
                      color: Colors.blue,
                      child: const Center(child: Text('Tap me')),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
