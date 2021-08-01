part of 'services.dart';

class RecordServices {
  static Future<Record> createRecord(String apiURL) async {
    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    Map<String, dynamic> object = jsonObject as Map<String, dynamic>;
    return Record.createRecord((object['rows'] as List)[0]);
  }
}
