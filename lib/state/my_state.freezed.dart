// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'my_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MyStateTearOff {
  const _$MyStateTearOff();

  _MyState call({QueryResult? result}) {
    return _MyState(
      result: result,
    );
  }
}

/// @nodoc
const $MyState = _$MyStateTearOff();

/// @nodoc
mixin _$MyState {
  QueryResult? get result => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyStateCopyWith<MyState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyStateCopyWith<$Res> {
  factory $MyStateCopyWith(MyState value, $Res Function(MyState) then) =
      _$MyStateCopyWithImpl<$Res>;
  $Res call({QueryResult? result});
}

/// @nodoc
class _$MyStateCopyWithImpl<$Res> implements $MyStateCopyWith<$Res> {
  _$MyStateCopyWithImpl(this._value, this._then);

  final MyState _value;
  // ignore: unused_field
  final $Res Function(MyState) _then;

  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as QueryResult?,
    ));
  }
}

/// @nodoc
abstract class _$MyStateCopyWith<$Res> implements $MyStateCopyWith<$Res> {
  factory _$MyStateCopyWith(_MyState value, $Res Function(_MyState) then) =
      __$MyStateCopyWithImpl<$Res>;
  @override
  $Res call({QueryResult? result});
}

/// @nodoc
class __$MyStateCopyWithImpl<$Res> extends _$MyStateCopyWithImpl<$Res>
    implements _$MyStateCopyWith<$Res> {
  __$MyStateCopyWithImpl(_MyState _value, $Res Function(_MyState) _then)
      : super(_value, (v) => _then(v as _MyState));

  @override
  _MyState get _value => super._value as _MyState;

  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_MyState(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as QueryResult?,
    ));
  }
}

/// @nodoc

class _$_MyState implements _MyState {
  _$_MyState({this.result});

  @override
  final QueryResult? result;

  @override
  String toString() {
    return 'MyState(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MyState &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(result);

  @JsonKey(ignore: true)
  @override
  _$MyStateCopyWith<_MyState> get copyWith =>
      __$MyStateCopyWithImpl<_MyState>(this, _$identity);
}

abstract class _MyState implements MyState {
  factory _MyState({QueryResult? result}) = _$_MyState;

  @override
  QueryResult? get result => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MyStateCopyWith<_MyState> get copyWith =>
      throw _privateConstructorUsedError;
}
