import 'package:flutter/material.dart';
import 'package:server_demo/services/ApiService.dart';

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
  ApiService apiService = ApiService.create();
  int result = 0;
  int a = 6500;
  int b = 1300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  '$a',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Divider(),
                Text(
                  '$b',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                print("before the api call");
                apiService.getSum(a: "$a", b: b.toString()).then((value) {
                  print(value.body["result"]);
                  setState(() {
                    result = value.body["result"];
                  });
                });
                print("after the api call");
              },
              child: Container(
                height: 100,
                child: Text("Press Me"),
                color: Colors.orangeAccent,
              ),
            ),
            Text("Result: $result"),
          ],
        ),
      ),
    );
  }
}
