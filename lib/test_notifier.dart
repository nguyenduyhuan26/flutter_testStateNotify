import 'package:flutter_testapp/state/my_state.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class TestNotifier extends StateNotifier<MyState> with LocatorMixin {
  TestNotifier() : super(MyState());
  String notify = "";
  bool isStart = false;

  void addValue(QueryResult queryResult) {
    state = MyState().copyWith(result: queryResult);
    print("abc");
    // print(state.result!.data!['users'].length.toString());
    if (isStart) {
      setNotification();
      state = MyState().copyWith(notify: notify);
    }
    isStart = true;
  }

  void setNotification() {
    if (state.result!.data!['users'].length == 1) {
      notify = "Đăng nhập thành công";
    } else {
      notify = "Đăng nhập thất bại";
    }
  }
}
