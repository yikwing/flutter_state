import 'package:meta/meta.dart';

@immutable
class CountState {
  int count;
  bool isSwitch;

  CountState({this.count, this.isSwitch});
}
