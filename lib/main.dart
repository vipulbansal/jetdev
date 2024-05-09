import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vipul_jet_assignment/blocs/auth/auth_bloc.dart';
import 'package:vipul_jet_assignment/views/auth/sign_in.dart';
import 'package:vipul_jet_assignment/views/splash/splash.dart';

import 'config/routes/routes.dart';
import 'constants/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final ThemeMode _selectedMode = ThemeMode.light;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppThemeManager.primaryBGColor,
          primarySwatch: AppThemeManager.appPrimaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: _selectedMode == ThemeMode.light
              ? Brightness.light
              : Brightness.dark,
          useMaterial3: false,
        ),
        darkTheme: ThemeData(
          scaffoldBackgroundColor: AppThemeManager.primaryBGColor,
          primarySwatch: AppThemeManager.appPrimaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: _selectedMode == ThemeMode.light
              ? Brightness.light
              : Brightness.dark,
          useMaterial3: false,
        ),
        themeMode: _selectedMode,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        initialRoute: Splash.routeName,
      ),
    );
  }
}
