import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_permissions/simple_permissions.dart';

class Permissions {
  String _platformVersion;
  Permission _permission;

  Permissions({Permission permissionWanted}) {
    initPlatformState();
    this._permission = permissionWanted;
  }

  initPlatformState() async {
    String _platformVersion;
    try {
      _platformVersion = await SimplePermissions.platformVersion;
      print(_platformVersion);
    } on PlatformException {
      _platformVersion = 'Failed to get platform version.';
    }
  }

  requestPermission() async {
    final res = await SimplePermissions.requestPermission(_permission);
    print("permission request result is " + res.toString());
  }

 Future<bool> checkPermission() async {
    bool res = await SimplePermissions.checkPermission(_permission);
    print("permission is " + res.toString());
    return res;
  }

  getPermissionStatus() async {
    final res = await SimplePermissions.getPermissionStatus(_permission);
    print("permission status is " + res.toString());
  }
}