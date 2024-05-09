import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants/app_theme.dart';

showAlert(BuildContext context,
    {String? title, String? message, Function? onOkPressed}) {
  // set up the button
  Widget okButton = TextButton(
    child: Text(
      'ok',
      style: AppThemeManager.gilroyMedium(
          fontSize: 16, color: CupertinoColors.activeBlue),
    ),
    onPressed: () {
      Navigator.of(context).pop();
      if (onOkPressed != null) {
        onOkPressed();
      }
    },
  );

  // set up the AlertDialog
  Widget alert;

  if (defaultTargetPlatform == TargetPlatform.iOS) {
    alert = CupertinoAlertDialog(
      title: title != null ? Text(title) : null,
      content: message != null ? Text(message) : null,
      actions: [
        okButton,
      ],
    );
  } else {
    alert = AlertDialog(
      title: title != null ? Text(title) : null,
      content: message != null ? Text(message) : null,
      actions: [
        okButton,
      ],
    );
  }
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showSnack(BuildContext context, {required String? message}) {
  final snackBar = SnackBar(content: Text(message ?? ''));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
