import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

enum AuthEventApiState { signInState, updateProfileState,logoutState }

@immutable
abstract class AuthEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent({this.email = '', this.password = ''});

  @override
  List<Object?> get props => [email, password];

  @override
  String toString() {
    return 'SignInEvent { email: $email, password: $password }';
  }
}

class LogoutEvent extends AuthEvent {}

class UpdateProfileFieldEvent extends AuthEvent {
  String fieldName;
  String fieldValue;

  UpdateProfileFieldEvent( this.fieldName, this.fieldValue);

  @override
  List<Object?> get props => [this.fieldName,this.fieldValue];
}



class ForgetPasswordEvent extends AuthEvent {
  final String email;
  final String phone;

  ForgetPasswordEvent({this.email = '', this.phone = ''});

  @override
  List<Object?> get props => [email, phone];

  @override
  String toString() {
    return 'ForgetPasswordEvent { email: $email, phone: $phone }';
  }
}

class VerifyOtpEvent extends AuthEvent {
  final String phone;
  final String otp;

  VerifyOtpEvent({this.phone = '', this.otp = ''});

  @override
  List<Object?> get props => [phone, otp];

  @override
  String toString() {
    return 'SignUpEvent { phone: $phone, otp: $otp }';
  }
}

class ResetPasswordEvent extends AuthEvent {
  final String email;
  final String newPassword;

  ResetPasswordEvent({this.email = '', this.newPassword = ''});

  @override
  List<Object?> get props => [email, newPassword];

  @override
  String toString() {
    return 'ResetPasswordEvent { email: $email, newPassword: $newPassword }';
  }
}
