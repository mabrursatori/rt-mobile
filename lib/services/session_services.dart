part of 'services.dart';

class SessionServices {
  // static void saveSession(String username, String password) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   pref.setString("username", username);
  //   pref.setString("password", password);
  // }

  // static Future<String> getUsername() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   return pref.getString("username") ?? null;
  // }

  // static Future<String> getPassword() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   return pref.getString("password") ?? null;
  // }

  static var session = FlutterSession();

  static void saveSession(String username, String password) async {
    await session.set("username", username);
    await session.set("password", password);
  }

  static Future<String> getUsername() async {
    return await FlutterSession().get("username");
  }

  static Future<String> getPassword() async {
    return await FlutterSession().get("password");
  }

  // static Future<String> getSession() async {
  //   Future<String> username = await FlutterSession().get("username");
  //   Future<String> password = await FlutterSession().get("password");
    
  // }

  // static getIp() async {
  //   String ipAddress = await GetIp.ipAddress;
  //   print(ipAddress); //192.168.232.2
  // }

}
