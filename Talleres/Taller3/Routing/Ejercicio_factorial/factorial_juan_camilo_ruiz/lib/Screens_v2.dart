import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _finalResult = 0;

  @override
  void initState() {
    super.initState();
  }

  void _computeFactorial() async {
    // Se obtiene el resultado del calculo del factorial
    int res = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => SecondScreen(currFact: 1)));

    // cuando llegue resultado de factorial, se muestra en pantalla
    setState(() {
      _finalResult = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    String textoHome = "Haz click en el botón para iniciar";
    if (_finalResult > 0) {
      textoHome = "El resultado del facotial es $_finalResult";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('$textoHome'),
          ElevatedButton(
              child: Text("X!"),
              onPressed: () {
                _computeFactorial();
              })
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final int currFact;

  const SecondScreen({Key? key, required this.currFact}) : super(key: key);

  void _nextFactPushed(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SecondScreen(currFact: currFact + 1)));
    Navigator.pop(context, result * currFact);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Continuacion, calculo de factorial"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('$currFact'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, currFact);
              },
              child: Text('='),
            ),
            ElevatedButton(
                onPressed: () {
                  _nextFactPushed(context);
                },
                child: Text("+"))
          ],
        ));
  }
}
