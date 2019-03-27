import 'package:flutter/material.dart';
import 'package:flutter_zhuangtai/redux/count_state.dart';
import 'package:flutter_zhuangtai/redux/switch_view_model.dart';
import 'package:flutter_zhuangtai/two_page.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_zhuangtai/redux/reducer.dart';

void main() {
  var store = Store<CountState>(
    reducer,
    initialState: CountState(
      count: 0,
      isSwitch: false,
    ),
  );

  runApp(
    MyApp(store),
  );
}

class MyApp extends StatelessWidget {
  final Store<CountState> store;

  MyApp(this.store);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<CountState>(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
      store: store,
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
            StoreConnector<CountState, int>(
              converter: (store) {
                return store.state.count;
              },
              builder: (context, count) {
                return Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
            StoreConnector<CountState, SwitchViewModel>(
              builder: (BuildContext context, SwitchViewModel vm) {
                return Switch(
                  onChanged: vm.onChange,
                  value: vm.active,
                );
              },
              converter: (Store store) => SwitchViewModel.fromState(store),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => TwoPages()));
        },
        child: Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
