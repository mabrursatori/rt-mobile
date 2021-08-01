part of 'models.dart';

class StatusUser {
  String status;
  String kete;
  StatusUser({this.status, this.kete});

  factory StatusUser.creteStatusUser(Map<String, dynamic> object) {
    return StatusUser(status: object['Status'], kete: object['kete']);
  }
}
