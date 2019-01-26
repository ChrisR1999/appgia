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
      _platformVersion = 'Error al obtener plataforma.';
    }
  }

  requestPermission() async {
    final res = await SimplePermissions.requestPermission(_permission);
    print("Resultado de pedir localización: " + res.toString());
  }

 Future<bool> checkPermission() async {
    bool res = await SimplePermissions.checkPermission(_permission);
    print("El permiso esta en:  " + res.toString());
    return res;
  }

  getPermissionStatus() async {
    final res = await SimplePermissions.getPermissionStatus(_permission);
    print("El estatus del permiso es: " + res.toString());
  }
}