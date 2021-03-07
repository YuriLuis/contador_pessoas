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
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Contador de pessoas'),
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
  String _texto = "Pode Entrar!";
  int _counter = 0;

  void _atualizaPessoasRestaurant(int valor) {
    setState(() {
      _counter += valor;
      _atualizaTextoTela();
    });
  }

  void _atualizaTextoTela(){
    if(_counter < 0){
      _texto = "Mundo invertido?!";
    }else if(_counter <= 10){
      _texto = "Pode Entrar";
    }else {
      _texto = "Restaurante Cheio!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("images/restaurant.jpg", fit: BoxFit.cover, height: 1000.0),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Pessoas: $_counter",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  child: Text("+1",
                      style: TextStyle(color: Colors.white, fontSize: 40.0)),
                  onPressed: () {
                    _atualizaPessoasRestaurant(1);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  child: Text("-1",
                      style: TextStyle(color: Colors.white, fontSize: 40.0)),
                  onPressed: () {
                    _atualizaPessoasRestaurant(-1);
                  },
                ),
              )
            ],
          ),
          Text(
            _texto,
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30.0),
          )
        ]),
      ],
    );
  }
}
