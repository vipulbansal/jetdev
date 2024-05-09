import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vipul_jet_assignment/config/routes/navigation_helper.dart';
import 'package:vipul_jet_assignment/constants/app_constants.dart';
import 'package:vipul_jet_assignment/helpers/my_shared_preferences.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/auth/auth_event.dart';
import '../../blocs/auth/auth_state.dart';
import '../../components/custom_email_text_title_field.dart';
import '../../components/custom_password_text_title_field.dart';
import '../../components/loader_view.dart';
import '../../components/show_alert_dialogs.dart';
import '../../components/widgets_helper.dart';
import '../../constants/app_theme.dart';
import '../home/home_page.dart';

class SignIn extends StatefulWidget {
  static const String routeName='SignInRoute';
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthBloc _bloc = AuthBloc();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = false;
  bool _emailVerified = false;
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;

  @override
  void initState() {
    _bloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(listener: (context, state) async {
          if (state.isSuccess) {
            hideLoader();
            //showAlert(context, title: localization().app_name, message: state.data);
            if(_rememberMe) {
              await MySharedPreferences.setSignInData(state.data!);
            }
            if (mounted) {
              context.pushNamedAndRemoveUntil(
                HomePage.routName,
                arguments: state.data,
                predicate: (Route<dynamic> route) => false,
              );
            }
          } else if (state.isFailure) {
            hideLoader();
            //showAlert(context, title: localization().app_name, message: state.errorMessage);
            showSnack(context, message: state.errorMessage);
          } else if (state.isLoading) {
            showLoader(context);
          } else {
            hideLoader();
          }
        }),
      ],
      child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  verticalSpacer(40),
                  CustomEmailTextTitleField(
                    onChangedValue: (verified) {
                      _emailVerified = verified;
                      setState(() {});
                    },
                    controller: emailController,
                    hint: 'abc@xyz.com',
                    emailVerified: _emailVerified,
                  ),
                  verticalSpacer(15),
                  CustomPasswordTextTitleField(
                    isPassword: _passwordVisible,
                    hint: '123456',
                    controller: passwordController,
                    onPressedValue: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  verticalSpacer(10),
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value ?? false;
                            MySharedPreferences.setBool(AppConstants.rememberKey, _rememberMe);
                          });

                        },
                      ),
                      Text('Remember Me')
                    ],
                  ),
                  verticalSpacer(20),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    // padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        getSignIn(
                            emailController.text, passwordController.text);
                      },
                      style: AppThemeManager.filledButton(
                          borderRadius: BorderRadius.circular(25)),
                      child: Text(
                        'Sign In',
                        style: AppThemeManager.gilroyBold(
                          fontSize: 16,
                          color: AppThemeManager.primaryTextColorWhite,
                        ),
                      ),
                    ),
                  ),
                  verticalSpacer(20),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  void didChangeDependencies() {
    setState(() {
      _passwordVisible = false;
      _emailVerified = false;
    });
    super.didChangeDependencies();
  }

  ///get sign in successfully with the help of proper condition with the help email and password params
  getSignIn(String visitorEmail, String visitorPassword) {
    if (!_emailVerified) {
      showAlert(context,
          title: 'jet devs', message: 'please_enter_valid_email');
    } else if (visitorPassword.isEmpty) {
      showAlert(context, title: 'jet devs', message: 'please_enter_password');
    } else {
      _bloc.add(SignInEvent(email: visitorEmail, password: visitorPassword));
    }
  }
}
