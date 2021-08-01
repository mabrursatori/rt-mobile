part of 'services.dart';

class TimeServices {
  static Future<Time> getTime(String nip) async {
    String ip;
    if (ipPublic == "203.210.85.36") {
      ip = "192.168.1.2";
    } else {
      ip = "203.210.85.36";
    }
    String apiURL =
        "http://$ip:8080/apiweb/dashboard.aspx?request=jamMasukPulang&nip=$nip";
    var apiResult = await http.get(apiURL);
    print("@@@@@@@@@@@@======================= " +
        apiResult.statusCode.toString() +
        "=============================@@@@@@");
    var jsonObject = json.decode(apiResult.body);
    return Time.createTime(jsonObject as Map<String, dynamic>);
  }
}
