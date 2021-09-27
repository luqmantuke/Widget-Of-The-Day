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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyDraggableScrollShit(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the DISMISABLE AND DIVIDER EXAMPLE State class that goes with MyStatefulWidget.
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   List<int> items = List<int>.generate(100, (int index) => index);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//       ),
//       body: ListView.separated(
//         separatorBuilder: (BuildContext context, int index) => const Divider(
//           thickness: 3,
//         ),
//         itemCount: items.length,
//         padding: const EdgeInsets.symmetric(vertical: 16),
//         itemBuilder: (BuildContext context, int index) {
//           return Dismissible(
//             child: ListTile(
//               title: Text(
//                 'Item ${items[index]}',
//               ),
//             ),
//             background: Container(
//               color: Colors.green,
//             ),
//             key: ValueKey<int>(items[index]),
//             onDismissed: (DismissDirection direction) {
//               setState(() {
//                 items.removeAt(index);
//               });
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// THIS IS A DRAGGABLE AND DRAGGABLE TARGET EXAMPLE

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int acceptedData = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Draggable<int>(
            // Data is the value this Draggable stores.
            data: 10,
            child: Container(
              height: 100.0,
              width: 100.0,
              color: Colors.lightGreenAccent,
              child: const Center(
                child: Text('Draggable'),
              ),
            ),
            feedback: Container(
              color: Colors.deepOrange,
              height: 100,
              width: 100,
              child: const Icon(Icons.directions_run),
            ),
            childWhenDragging: Container(
              height: 100.0,
              width: 100.0,
              color: Colors.pinkAccent,
              child: const Center(
                child: Text('Child When Dragging'),
              ),
            ),
          ),
          DragTarget<int>(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return Container(
                height: 100.0,
                width: 100.0,
                color: Colors.cyan,
                child: Center(
                  child: Text('Value is updated to: $acceptedData'),
                ),
              );
            },
            onAccept: (int data) {
              setState(() {
                acceptedData += data;
              });
            },
          ),
        ],
      ),
    );
  }
}

class MyDraggableScrollShit extends StatelessWidget {
  const MyDraggableScrollShit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DraggableScrollableSheet'),
      ),
      body: SizedBox.expand(
        child: DraggableScrollableSheet(
          minChildSize: 0.2,
          initialChildSize: 1,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              color: Colors.blue[100],
              child: ListView.builder(
                controller: scrollController,
                itemCount: 25,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text('Item $index'));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
