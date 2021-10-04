import 'package:freezed_annotation/freezed_annotation.dart';

// 2. Declare this:
part 'create_login_state.freezed.dart';

// 3. Annotate the class with @freezed
@freezed
// 4. Declare the class as abstract and add `with _$ClassName`
abstract class CreateLoginState with _$CreateLoginState {
  // 5. Create a `const factory` constructor for each valid state
  const factory CreateLoginState.noError() = _NoError;
  const factory CreateLoginState.error(String? errorText) = _Error;
  const factory CreateLoginState.loading() = _Loading;
}
