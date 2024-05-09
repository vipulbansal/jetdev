import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/profile.dart';
import '../auth/auth_bloc.dart';

enum SplashEventApiState { getVersion }

@immutable
abstract class SplashEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class NavigateEvent extends SplashEvent {
  final Profile? profile;
  final AuthBloc authBloc;

  NavigateEvent(this.profile, this.authBloc);

  @override
  List<Object?> get props => [this.profile];
}
