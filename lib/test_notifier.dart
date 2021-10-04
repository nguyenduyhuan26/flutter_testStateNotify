import 'package:flutter_testapp/state/my_state.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class TestNotifier extends StateNotifier<MyState> with LocatorMixin {
  TestNotifier() : super(MyState());
  String notify = "";
  void addState(QueryResult queryResult) {
    state = MyState().copyWith(result: queryResult);
    //print(state.result!.data!['users'].length.toString());
    setNotification();
    print(notify);
  }

  void setNotification() {
    if (state.result!.data!['users'].length == 1) {
      notify = "Đăng nhập thành công";
    } else {
      notify = "Đăng nhập thất bại";
    }
  }
}
