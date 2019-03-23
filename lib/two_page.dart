import 'package:flutter/material.dart';
import 'package:flutter_zhuangtai/counter.dart';
import 'package:flutter_zhuangtai/switch.dart';
import 'package:provide/provide.dart';

class TwoPages extends StatelessWidget {
  final Widget child;

  TwoPages({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('two pages'),
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
            Provide<SwitchChange>(
              builder:
                  (BuildContext context, Widget child, SwitchChange swchange) {
                return Switch(
                  onChanged: (bool value) {
                    swchange.changeSwitch(value);
                  },
                  value: swchange.isSwitch,
                );
              },
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
