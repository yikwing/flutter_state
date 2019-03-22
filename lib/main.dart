import 'package:flutter/material.dart';
import 'package:flutter_zhuangtai/counter.dart';
import 'package:provide/provide.dart';

void main() {
  var counter = Counter();
  var provider = Providers();

  provider.provide(Provider<Counter>.value(counter));

  runApp(
    ProviderNode(
      child: MyApp(),
      providers: provider,
    ),
  );
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Provide<Counter>(
              builder: (context, child, counter) {
                return Text(
                  '${counter.value}',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
            StreamBuilder<Counter>(
              initialData: Provide.value<Counter>(context),
              stream: Provide.stream<Counter>(context)
                  .where((counter) => counter.value % 2 == 0),
              builder: (context, snapshot) =>
                  Text('Last even value: ${snapshot.data.value}'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provide.value<Counter>(context).increment();
          print(Provide.value<Counter>(context).value);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
