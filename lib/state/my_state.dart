import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_state.freezed.dart';

@freezed
class MyState with _$MyState {
  factory MyState({QueryResult? result, String? notify}) = _MyState;
}
