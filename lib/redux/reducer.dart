import 'package:flutter_zhuangtai/redux/action.dart';

import 'count_state.dart';

CountState reducer(CountState state, action) {
  switch (action) {
    case Action.increment:
      state.count += 1;
      break;
    case Action.changeSwitch:
      state.isSwitch = !state.isSwitch;
      break;
    default:
      break;
  }
  return state;
}
