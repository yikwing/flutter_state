import 'package:flutter_zhuangtai/redux/action.dart';

import 'count_state.dart';

CountState reducer(CountState state, action) {
  //匹配Action
  if (action == Action.increment) {
    return CountState(state.count + 1);
  }
  return state;
}
