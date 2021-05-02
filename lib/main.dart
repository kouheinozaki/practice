import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label:('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.timeline), label:('Timeline'),),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label:('Chat')),
        ],
        fixedColor: Colors.blueAccent,
        type: BottomNavigationBarType.fixed,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return SubPage();
            })), child: new Text('Subページへ'),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class SubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subページ"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label:('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.timeline), label:('Timeline'),),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label:('Chat')),
        ],
        fixedColor: Colors.blueAccent,
        type: BottomNavigationBarType.fixed,),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Sub"),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),  // この画面を取り除く
                child: Text("戻る"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
