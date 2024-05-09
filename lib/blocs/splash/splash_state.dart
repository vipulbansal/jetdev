import 'package:meta/meta.dart';

import '../../models/profile.dart';

@immutable
class SplashState {
  final dynamic apiState;
  final bool isSuccess;
  final bool isFailure;
  final String errorMessage;
  final bool isLoading;
  final Profile? data;

  SplashState({this.apiState = '', this.isSuccess = false, this.isFailure = false, this.errorMessage = '', this.isLoading = false, this.data});

  factory SplashState.empty({required SplashState currentState}) {
    return currentState.copyWith(isSuccess: false, isFailure: false, errorMessage: "", isLoading: false);
  }

  factory SplashState.loading({required SplashState currentState}) {
    return currentState.copyWith(isSuccess: false, isFailure: false, errorMessage: "", isLoading: true);
  }

  factory SplashState.failure(String message, {required SplashState currentState}) {
    return currentState.copyWith(isSuccess: false, isFailure: true, isLoading: false, errorMessage: message);
  }

  factory SplashState.success(apiState, data, {required SplashState currentState}) {
    return currentState.copyWith(isSuccess: true, isFailure: false, errorMessage: "", isLoading: false, apiState: apiState, data: data);
  }

  SplashState update() {
    return copyWith(isSuccess: false, isFailure: false, isLoading: false, errorMessage: "");
  }

  SplashState copyWith({
    dynamic apiState,
    bool? isSuccess,
    bool? isFailure,
    String? errorMessage,
    bool? isLoading,
    Profile? data,
  }) {
    return SplashState(
      apiState: apiState ?? this.apiState,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
    );
  }


  @override
  String toString() {
    return '''SplashState {
      isSuccess: $isSuccess,
      isFailure: $isFailure,
      errorMessage: $errorMessage
    }''';
  }
}
