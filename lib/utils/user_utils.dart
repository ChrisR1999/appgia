class UserUtils {
  static String _firebaseId;
  static String _name;
  static String _mail;
  static String _number;

  

  static set firebaseId(String firebaseId) {
    _firebaseId = firebaseId;
  }

  static set name(String name) {
    _name = name;
  }

  static set mail(String mail) {
    _firebaseId = firebaseId;
  }

  static set number(String number) {
    _number = number;
  }

  static String get firebaseId => _firebaseId;
  static String get name => _name;
  static String get mail => _mail;
  static String get number => _number;
}
