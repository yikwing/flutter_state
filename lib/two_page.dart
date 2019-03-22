import 'package:flutter/material.dart';
import 'package:flutter_zhuangtai/redux/action.dart';
import 'package:flutter_zhuangtai/redux/count_state.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

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
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            StoreConnector<CountState, int>(
              builder: (BuildContext context, int vm) {
                return Text(
                  vm.toString(),
                  style: Theme.of(context).textTheme.display1,
                );
              },
              converter: (Store store) => store.state.count,
            )
          ],
        ),
      ),
      floatingActionButton: StoreConnector<CountState, VoidCallback>(
        builder: (BuildContext context, VoidCallback vm) {
          return FloatingActionButton(
            onPressed: vm,
            child: Icon(Icons.add),
          );
        },
        converter: (Store store) {
          return () => store.dispatch(Action.increment);
        },
      ),
    );
  }
}
