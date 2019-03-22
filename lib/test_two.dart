import 'package:flutter/material.dart';
import 'package:flutter_zhuangtai/blocs/count_bloc.dart';
import 'package:flutter_zhuangtai/realank_flutter_bloc.dart';

class TwoPages extends StatefulWidget {
  final Widget child;

  TwoPages({Key key, this.child}) : super(key: key);

  _TwoPagesState createState() => _TwoPagesState();
}

class _TwoPagesState extends State<TwoPages> {
  @override
  Widget build(BuildContext context) {
    return RLKBLoCBuilder(
      builder: (BuildContext context, data, RLKBaseBLoC bloc) {
        var countBLoC = bloc as CountBLoC;
        return Scaffold(
          appBar: AppBar(
            title: Text('two Page'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$data',
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              countBLoC.increment();
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
