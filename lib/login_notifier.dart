import 'package:flutter_testapp/state/create_login_state.dart';
import 'package:flutter_testapp/state/my_state.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class LoginNotifier extends StateNotifier<CreateLoginState> with LocatorMixin {
  LoginNotifier() : super(CreateLoginState.noError());
  addState(QueryResult queryResult) {
    // state = queryResult;
  }

  auth({String? username, String? password}) {}
}
