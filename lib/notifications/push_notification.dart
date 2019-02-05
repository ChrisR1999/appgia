import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:app_trabajo/notifications/notifications.dart';
import 'package:app_trabajo/models/panicresponse_model.dart';
import 'package:app_trabajo/models/notification_model.dart';

class PushNotifications {
  PanicResponse _model;
  FirebaseMessaging _firebaseMessaging;
  static List<NotificationModel> _notificationsList;

  PushNotifications() {
    print("Iniciando clase para notificaciones push...");
    _model = new PanicResponse();
    _notificationsList = new List<NotificationModel>();
    _firebaseMessaging = new FirebaseMessaging();
    _firebaseMessaging.setAutoInitEnabled(true);
    _firebaseMessaging.configure(onLaunch: (Map<String, dynamic> msg) {
      print("Called onLaunch");
      Notifications.showNotification(0);
      print(msg);
      _model.fromJson(msg['data']);
      searchNotification(_model.typeOfPanic);
    }, onResume: (Map<String, dynamic> msg) {
      print("Called onResume");
      _model.fromJson(msg);
      searchNotification(_model.typeOfPanic);
    }, onMessage: (Map<String, dynamic> msg) {
      print("onMessage called");
      print(msg);
      _model.fromJson(msg['data']);
      searchNotification(_model.typeOfPanic);
    });
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, alert: true, badge: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print(" IOS Settings Registed ");
    });
    _firebaseMessaging.getToken().then((onValue) {
      print(onValue);
    });
  }

  void searchNotification(String typeOfAlert) async{
    final NotificationModel notification = _notificationsList
        .firstWhere((item) => item.typeOfAlert == typeOfAlert);
    _notificationsList.remove(notification);
    if (notification.status == 0) {
      notification.onResponse();
      print("Cambiando color: Petición aceptada, socorro en camino");
      notification.status = 1;
      _notificationsList.add(notification);
      await Notifications.showNotification(notification.status);
    } else if (notification.status == 1) {
      print("Cambiando color: Petición completada, danos un feedback");
      notification.onComplete();
      await Notifications.showNotification(notification.status);
    }
  }

  static void addNotification(NotificationModel notification) {
    _notificationsList.add(notification);
  }
}
