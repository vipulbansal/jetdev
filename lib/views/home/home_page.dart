import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vipul_jet_assignment/blocs/auth/auth_event.dart';
import 'package:vipul_jet_assignment/config/routes/navigation_helper.dart';
import 'package:vipul_jet_assignment/helpers/my_shared_preferences.dart';
import 'package:vipul_jet_assignment/views/auth/sign_in.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/auth/auth_state.dart';
import '../../components/show_alert_dialogs.dart';
import '../../helpers/permission_handler_helper.dart';
import 'edit_field_page.dart';

class HomePage extends StatefulWidget {
  static const String routName = 'HomePageRoute';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker _picker = ImagePicker();

  File? profileImage;

  @override
  void initState() {
    super.initState();
    String? profileImagePath = context.read<AuthBloc>().state.data?.avatarPath;
    if (profileImagePath != null) {
      profileImage = File(profileImagePath);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Icon(Icons.power_off),
              onTap: () => context.read<AuthBloc>().add(LogoutEvent()),
            ),
          )
        ],
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state.isSuccess &&
              state.apiState == AuthEventApiState.logoutState) {
            await MySharedPreferences.clearAll();
            context.pushNamedAndRemoveUntil(
              SignIn.routeName,
              predicate: (Route<dynamic> route) => false,
            );
          }
        },
        builder: (context, state) {
          return BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state.isSuccess) {
                final profile = state.data!;
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: ListView(
                    children: [
                      InkWell(
                        onTap: () => _checkCameraPermission(),
                        child: Center(
                          child: ClipOval(
                            child: profile.avatarPath == null
                                ? Image.asset(
                                    "assets/images/avatar.png",
                                    width: 100,
                                    height: 100,
                                  )
                                : Image(
                                    image: FileImage(File(profile.avatarPath!)),
                                    width: 100.0,
                                    height: 100.0,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                      _buildProfileField(
                        context,
                        title: 'Name',
                        value: profile.name,
                        fieldName: 'name',
                      ),
                      _buildProfileField(
                        context,
                        title: 'Work Experience',
                        value: profile.workExperience,
                        fieldName: 'workExperience',
                      ),
                      _buildProfileField(
                        context,
                        title: 'Skills',
                        value: profile.skills,
                        fieldName: 'skills',
                      ),
                      ListTile(
                        title: Text('Email: ${profile.email}'),
                      ),
                    ],
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          );
        },
      ),
    );
  }

  // Utility method to build profile fields
  Widget _buildProfileField(
    BuildContext context, {
    required String title,
    required String value,
    required String fieldName,
  }) {
    return ListTile(
      title: Text('$title: $value'),
      trailing: IconButton(
        icon: Icon(Icons.edit),
        onPressed: () {
          context.push(
            MaterialPageRoute(
              builder: (_) => EditFieldPage(
                fieldName: fieldName,
                initialValue: value,
              ),
            ),
          );
        },
      ),
    );
  }

  _checkCameraPermission() async {
    List<Permission> permissionsToCheck = [Permission.camera];
    if (await PermissionHandlerHelper.checkMultiplePermissions(
        permissionsToCheck)) {
      final XFile? file = await _picker.pickImage(source: ImageSource.camera);
      if (file != null) {
        profileImage = File(file.path);
        context
            .read<AuthBloc>()
            .add(UpdateProfileFieldEvent('avatar', file.path));
      }
    } else {
      showAlert(context,
          message: 'Camera_permission_denied',
          onOkPressed: () async => await openAppSettings());
    }
  }
}
