import 'package:flutter_zhuangtai/redux/action.dart';
import 'package:flutter_zhuangtai/redux/count_state.dart';
import 'package:redux/redux.dart';

class SwitchViewModel {
  bool active;
  void Function(bool active) onChange;

  SwitchViewModel(this.active, this.onChange);

  factory SwitchViewModel.fromState(Store<CountState> store) {
    return SwitchViewModel(
      store.state.isSwitch,
      (active) => store.dispatch(Action.changeSwitch),
    );
  }
}
