part of 'services.dart';

class UserServices {
  static Future<User> getUser(String username, String password) async {
    String ip;
    if (ipPublic == "203.210.85.36") {
      ip = "192.168.1.2";
    } else {
      ip = "203.210.85.36";
    }
    String apiURL =
        "http://$ip:8080/apiweb/control.aspx?username=$username&password=$password";
    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    Map<String, dynamic> object = jsonObject as Map<String, dynamic>;
    statusUser = StatusUser.creteStatusUser(object);
    if (statusUser.status == "ok") {
      return User.createUser((object['rows'] as List)[0]);
    } else {
      return null;
    }
  }
}
