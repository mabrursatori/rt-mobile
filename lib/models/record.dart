part of 'models.dart';

class Record {
  String pin;
  String nip;
  String nama;
  String jabatan;
  String waktu;
  String status;

  Record(
      {this.pin, this.nip, this.nama = "Mabrur", this.jabatan, this.waktu, this.status});

  factory Record.createRecord(Map<String, dynamic> object) {
    return Record(
        pin: object['PIN'],
        nip: object['NIP'],
        nama: object['NAMA'],
        jabatan: object['JABATAN'],
        waktu: object['WAKTU'],
        status: object['STATUS']);
  }
}
