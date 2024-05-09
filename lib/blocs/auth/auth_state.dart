import 'package:meta/meta.dart';

import '../../models/profile.dart';

@immutable
class AuthState {
  final dynamic apiState;
  final bool isSuccess;
  final bool isFailure;
  final String errorMessage;
  final bool isLoading;
  final Profile? data;


  AuthState({this.apiState = '', this.isSuccess = false, this.isFailure = false, this.errorMessage = '', this.isLoading = false, this.data = null});

  factory AuthState.empty({required AuthState currentState}) {
    return currentState.copyWith(isSuccess: false, isFailure: false, errorMessage: "", isLoading: false);
  }

  factory AuthState.loading({required AuthState currentState}) {
    return currentState.copyWith(isSuccess: false, isFailure: false, errorMessage: "", isLoading: true);
  }

  factory AuthState.failure(String message, {required AuthState currentState}) {
    return currentState.copyWith(isSuccess: false, isFailure: true, isLoading: false, errorMessage: message);
  }

  factory AuthState.success(apiState, Profile data, {required AuthState currentState}) {
    return currentState.copyWith(isSuccess: true, isFailure: false, errorMessage: "", isLoading: false, apiState: apiState, data: data);
  }


  AuthState update() {
    return copyWith(isSuccess: false, isFailure: false, isLoading: false, errorMessage: "");
  }

  AuthState copyWith({
    dynamic apiState,
    bool? isSuccess,
    bool? isFailure,
    String? errorMessage,
    bool? isLoading,
    Profile? data,
  }) {
    return AuthState(
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
    return '''AuthState {
      isSuccess: $isSuccess,
      isFailure: $isFailure,
      errorMessage: $errorMessage
    }''';
  }
}
