import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vipul_jet_assignment/constants/app_constants.dart';
import 'package:vipul_jet_assignment/helpers/my_shared_preferences.dart';
import 'package:vipul_jet_assignment/models/profile.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<SignInEvent>((SignInEvent event, Emitter<AuthState> emitter) async {
      await _mapSignInToState(emitter,
          email: event.email, password: event.password);
    });

    on<UpdateProfileFieldEvent>((event, emit) async {
      // Update the specific field using the field name
      Profile _profile =
          _updateProfileField(state.data!, event.fieldName, event.fieldValue);
      bool isRemember =
          await MySharedPreferences.getBool(AppConstants.rememberKey);
      if (isRemember) {
        MySharedPreferences.setSignInData(_profile);
      }
      emit(AuthState.success(AuthEventApiState.updateProfileState, _profile,
          currentState: state));
    });

    on<LogoutEvent>((event, emit) async {
      emit(AuthState.success(AuthEventApiState.logoutState,
      state.data!,currentState: state));
    });
  }

  // Utility function to update the specific profile field
  Profile _updateProfileField(
      Profile profile, String fieldName, String newValue) {
    switch (fieldName) {
      case 'name':
        return profile.copyWith(name: newValue);
      case 'workExperience':
        return profile.copyWith(workExperience: newValue);
      case 'skills':
        return profile.copyWith(skills: newValue);
      case 'avatar':
        return profile.copyWith(avatarPath: newValue);
      default:
        return profile; // If the field name is not recognized, return the original profile
    }
  }

  _mapSignInToState(Emitter<AuthState> emit,
      {required String email, required String password}) async {
    try {
      emit(AuthState.loading(currentState: state));
      if (email.toLowerCase() == 'vipul@xpertstechsolutions.com' && password == 'vipul') {
        emit(AuthState.success(
            AuthEventApiState.signInState,
            Profile(
                avatarPath: null,
                name: 'Vipul Bansal',
                email: email,
                workExperience: '8 years',
                skills: 'Android, Flutter'),
            currentState: state));
      } else {
        emit(AuthState.failure('Invalid username or password',
            currentState: state));
      }
    } catch (e) {
      print('sign in api error: $e');
      emit(AuthState.failure('Something went wrong', currentState: state));
    }
  }
}
