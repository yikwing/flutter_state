import 'package:meta/meta.dart';

/**
 * State中所有属性都应该是只读的
 */
@immutable
class CountState {
  int _count;
  get count => _count;

  CountState(this._count);

  CountState.initState() {
    _count = 0;
  }
}
