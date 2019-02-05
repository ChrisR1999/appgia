import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications {
  static FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  Notifications() {
    print("Inicializando clase de notificaciones");
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    _flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: _onSelectNotification);
  }

  Future _onSelectNotification(String payload) async {}

  static Future showNotification(int status) async {
    print("Mostrando notificación con sonido");
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    switch (status) {
      case 0:
        await _flutterLocalNotificationsPlugin.show(
          0,
          'New Post',
          'How to Show Notification in Flutter',
          platformChannelSpecifics,
          payload: 'Default_Sound',
        );
        break;
      case 1:
        await _flutterLocalNotificationsPlugin.show(
          1,
          'New Post',
          'How to Show Notification in Flutter',
          platformChannelSpecifics,
          payload: 'Default_Sound',
        );
        break;
    }
  }
}
