import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:app_trabajo/models/panicresponse_model.dart';

class Notifications {
  int status;
  String typeOfAlert;
  Function onResponse;
  Function onComplete;
  Notifications(
      {this.status, this.typeOfAlert, this.onResponse, this.onComplete});
}

class PushNotifications {
  PanicResponse _model;
  FirebaseMessaging _firebaseMessaging;
  static List<Notifications> _notificationsList;

  PushNotifications() {
    print("Iniciando clase para notificaciones push...");
    _model = new PanicResponse();
    _notificationsList = new List<Notifications>();
    _firebaseMessaging = new FirebaseMessaging();
    _firebaseMessaging.configure(onLaunch: (Map<String, dynamic> msg) {
      print("Called onLaunch");
      _model.fromJson(msg['data']);
      searchNotification(_model.typeOfPanic);
    }, onResume: (Map<String, dynamic> msg) {
      print("Called onResume");
      _model.fromJson(msg['data']);
      searchNotification(_model.typeOfPanic);
    }, onMessage: (Map<String, dynamic> msg) {
      print("onMessage called");
      _model.fromJson(msg['data']);
      searchNotification(_model.typeOfPanic);
    });
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, alert: true, badge: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print(" IOS Settings Registed ");
    });
  }

  void searchNotification(String typeOfAlert) {
    final Notifications notification = _notificationsList
        .firstWhere((item) => item.typeOfAlert == typeOfAlert);
    _notificationsList.remove(notification);
    if (notification.status == 0) {
      notification.onResponse();
      print("Cambiando color");
      notification.status = 1;
      _notificationsList.add(notification);
    } else if (notification.status == 1) {
      notification.onComplete();
    }
  }

  static void addNotification(Notifications notification) {
    _notificationsList.add(notification);
  }
}
