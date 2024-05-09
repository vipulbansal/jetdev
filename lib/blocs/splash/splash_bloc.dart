import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vipul_jet_assignment/blocs/auth/auth_event.dart';
import 'package:vipul_jet_assignment/blocs/auth/auth_state.dart';

import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<NavigateEvent>(
        (NavigateEvent event, Emitter<SplashState> emitter) async {
      await _mapVersionToState(event, emitter);
    });
  }

  // Make sure the method is asynchronous and you await all necessary operations.
  Future<void> _mapVersionToState(
      NavigateEvent event, Emitter<SplashState> emit) async {
    emit(SplashState.loading(currentState: state));
    try {
      // Check if the emitter has been completed
      if (event.profile != null) {
        event.authBloc.emit(AuthState.success(
            AuthEventApiState.signInState, event.profile!,
            currentState: event.authBloc.state));
        emit(SplashState.success(SplashEventApiState.getVersion, event.profile,
            currentState: state));
      } else {
        emit(SplashState.empty(currentState: state));
      }
    } catch (e) {
      print('version api error: $e');
      // Check again if the emitter is still active before calling emit.
      if (!emit.isDone) {
        emit(SplashState.failure('Something went wrong', currentState: state));
      }
    }
  }
}
