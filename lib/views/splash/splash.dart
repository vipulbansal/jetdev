import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vipul_jet_assignment/blocs/auth/auth_bloc.dart';
import 'package:vipul_jet_assignment/blocs/splash/splash_event.dart';
import 'package:vipul_jet_assignment/blocs/splash/splash_state.dart';
import 'package:vipul_jet_assignment/config/routes/navigation_helper.dart';
import 'package:vipul_jet_assignment/constants/app_theme.dart';
import 'package:vipul_jet_assignment/views/auth/sign_in.dart';
import 'package:vipul_jet_assignment/views/home/home_page.dart';

import '../../blocs/splash/splash_bloc.dart';
import '../../helpers/my_shared_preferences.dart';

class Splash extends StatefulWidget {
  static const String routeName='splashRoute';
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SplashBloc _bloc = SplashBloc();
  var signInData;
  bool icon = false;
  bool loader = true;
  static const int EXTRA_DELAY = 0;
  bool isFirstTime = true;

  @override
  void initState() {
    _bloc = BlocProvider.of<SplashBloc>(context);
    _checkLoginStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if(state.isSuccess){
          context.pushNamedAndRemoveUntil(HomePage.routName, predicate: (Route<dynamic> route) => false,);
        }
        else{
          context.pushNamedAndRemoveUntil(SignIn.routeName, predicate: (Route<dynamic> route) => false,);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppThemeManager.appPrimaryColor,
          body: Center(
            child: Image.asset(
              "assets/images/splash_background.png",
              width: 160,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _initServices() async {
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    if (!isFirstTime) {
      return;
    }
    isFirstTime = false;
    await Future.delayed(const Duration(seconds: EXTRA_DELAY));
    signInData = await MySharedPreferences.getSignInData();
    Future.delayed(const Duration(seconds: 2), () {
      _bloc.add(NavigateEvent(signInData, context.read<AuthBloc>()));
    });
  }
}
