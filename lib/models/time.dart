part of 'models.dart';

class Time {
  final String jamMasuk;
  final String jamKeluar;
  final String status;
  final String ket;
  final double jumlahData;
  final String message;
  Time(
      {this.jamMasuk,
      this.jamKeluar,
      this.status,
      this.ket,
      this.jumlahData,
      this.message = "connected"});

  factory Time.createTime(Map<String, dynamic> object) {
    return Time(
        jamMasuk: (object['rows'] as List)[0]['JAM_MASUK'],
        jamKeluar: (object['rows'] as List)[0]['JAM_KELUAR'],
        status: object['Status'],
        ket: object['kete'].toString(),
        jumlahData: (object['jumlah_data'] as num).toDouble());
  }
}
