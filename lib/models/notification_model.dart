class NotificationModel {
  int status;
  String typeOfAlert;
  Function onResponse;
  Function onComplete;
  NotificationModel(
      {this.status, this.typeOfAlert, this.onResponse, this.onComplete});
}
