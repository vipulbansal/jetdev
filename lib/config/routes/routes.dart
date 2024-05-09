import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vipul_jet_assignment/blocs/splash/splash_bloc.dart';

import '../../views/auth/sign_in.dart';
import '../../views/home/home_page.dart';
import '../../views/splash/splash.dart';


class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case SignIn.routeName:
        return _materialRoute(const SignIn());
      case HomePage.routName:
        return _materialRoute(HomePage());
      case Splash.routeName:
        return _materialRoute(BlocProvider(
          create: (context) => SplashBloc(),
          child: const Splash(),
        ));
      default:
        return _materialRoute(const Splash());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
