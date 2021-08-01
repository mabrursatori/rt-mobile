part of 'models.dart';

class User {
  String username;
  String kodeLevel;
  String menuRTE;
  String nip;
  bool nipAtasan;
  String nama;
  String kodeCabang;
  String namaCabang;
  String kodeDepartemen;
  String tanggalTutup;
  String lastUpdate;
  String pin;
  String tipeEntry;
  bool entryBersambung;
  String namaLevel;

  User(
      {this.username,
      this.kodeLevel,
      this.menuRTE,
      this.nip,
      this.nipAtasan,
      this.nama,
      this.kodeCabang,
      this.namaCabang,
      this.kodeDepartemen,
      this.tanggalTutup,
      this.lastUpdate,
      this.pin,
      this.tipeEntry,
      this.entryBersambung,
      this.namaLevel});

  factory User.createUser(Map<String, dynamic> object) {
    return User(
        username: object['USERNAME'],
        kodeLevel: object['KODE_LEVEL'],
        menuRTE: object['MENU_RTE'],
        nip: object['NIP'],
        nipAtasan: object['NIP_ATASAN'],
        nama: object['NAMA'],
        kodeCabang: object['KODE_CABANG'],
        namaCabang: object['NAMA_CABANG'],
        kodeDepartemen: object['KODE_DEPARTEMEN'],
        tanggalTutup: object['TGL_TUTUP'],
        lastUpdate: object['Last_Update'],
        pin: object['PIN'],
        tipeEntry: object['TIPE_ENTRY'],
        entryBersambung: object['ENTRY_BERSAMBUNG'],
        namaLevel: object['NAMA_LEVEL']);
  }
}
