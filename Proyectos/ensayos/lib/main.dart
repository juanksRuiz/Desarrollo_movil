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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'Pruebas Front End'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _x1 = 1, _x2 = 1;
  int _result = 2;
  bool _isButtonNextdisabled = true;
  void _get_Last_Fibonacci_number() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      int temp = _x2;
      _x2 = _result;
      _x1 = temp;
      _result = _x1 + _x2;
      _isButtonNextdisabled = false;
    });
  }

  void _onReset() {
    setState(() {
      _isButtonNextdisabled = true;
      _x1 = 1;
      _x2 = 1;
      _result = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: _isButtonNextdisabled ? null : _onReset,
                    child: Text("Reiniciar sucesión",
                        style: Theme.of(context).textTheme.headline4)),
                ElevatedButton(
                    onPressed: _get_Last_Fibonacci_number,
                    child: Text("Siguiente",
                        style: Theme.of(context).textTheme.headline4))
              ],
            ),
          ),
          Text("El siguiente numero de la sucesión de Fibonacci es:"),
          Container(
              child: Text('$_result'),
              margin: const EdgeInsets.only(bottom: 10)),
          Row(
            children: [
              Container(
                color: Colors.blue,
                width: 150,
                height: 300,
              ),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                color: Colors.amber,
                height: 250,
              )),
              Container(
                color: Colors.red,
                width: 150,
                height: 200,
              ),
              Expanded(
                  child: Container(
                color: Colors.amber,
                height: 250,
              ))
            ],
          )
        ],
      )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
