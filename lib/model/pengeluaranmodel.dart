/** Mengimpor pustaka dart:convert untuk operasi serialisasi dan deserialisasi JSON **/
import 'dart:convert';

// Kelas PengeluaranModel mewakili model data untuk catatan pengeluaran
class PengeluaranModel {
  ///  Properti id, selectedDate, namabarang, dan hargabarang
  String? id;

  /// ID pengeluaran (opsional)
  final String selectedDate;

  ///  Tanggal pengeluaran yang dipilih
  final String namabarang; // Nama barang yang dibeli
  final String hargabarang; // Harga barang yang dibeli

  /// Konstruktor untuk membuat objek PengeluaranModel
  PengeluaranModel({
    this.id, // Parameter opsional untuk ID pengeluaran
    required this.selectedDate, // Parameter wajib untuk tanggal pengeluaran
    required this.namabarang, // Parameter wajib untuk nama barang
    required this.hargabarang, // Parameter wajib untuk harga barang
  });

  /// Metode toMap() mengonversi objek PengeluaranModel menjadi map
  Map<String, dynamic> toMap() {
    return {
      'id': id, // Menambahkan ID jika tersedia
      'selectedDate': selectedDate, // Menambahkan tanggal pengeluaran
      'namabarang': namabarang, // Menambahkan nama barang
      'hargabarang': hargabarang, // Menambahkan harga barang
    };
  }

  // Factory method fromMap() mengonversi map menjadi objek PengeluaranModel
  factory PengeluaranModel.fromMap(Map<String, dynamic> map) {
    return PengeluaranModel(
      id: map['id'], // Mengambil ID dari map jika tersedia
      selectedDate: map['selectedDate'] ??
          '', // Mengambil tanggal pengeluaran dari map, default: ''
      namabarang: map['namabarang'] ??
          '', // Mengambil nama barang dari map, default: ''
      hargabarang: map['hargabarang'] ??
          '', // Mengambil harga barang dari map, default: ''
    );
  }

  /// Metode toJson() mengonversi objek PengeluaranModel menjadi representasi JSON menggunakan json.encode()
  String toJson() => json.encode(toMap());

  /// Factory method fromJson() mengonversi representasi JSON menjadi objek PengeluaranModel menggunakan json.decode()
  factory PengeluaranModel.fromJson(String source) =>
      PengeluaranModel.fromMap(json.decode(source));
}
