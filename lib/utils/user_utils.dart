class UserUtils {
  static String _name;
  static String _mail;
  static String _number;
  static String _photo;

  UserUtils({String name, String mail}) {
    _name = name;
    _mail = mail;
  }

  static String getName(){ return _name;}
  static String getMail(){ return _mail;}
}
