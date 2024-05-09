import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerHelper {
  static Future<bool> checkMultiplePermissions(List<Permission> permissions) async {
    Map<Permission, PermissionStatus> status = await permissions.request();
    bool allGranted = true;

    status.forEach((permission, permissionStatus) {
      if (permissionStatus != PermissionStatus.granted) {
        allGranted = false;
      }
    });

    return allGranted;
  }
}
