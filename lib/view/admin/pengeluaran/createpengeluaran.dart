/// Mengimpor paket-paket yang diperlukan dari Flutter
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

/// Mengimpor kelas-kelas terkait dari file lain
import 'package:redlenshoescleaning/controller/pengeluarancontroller.dart';
import 'package:redlenshoescleaning/model/pengeluaranmodel.dart';

///Kelas CreatePengeluaran merupakan StatefulWidget untuk halaman tambah pengeluaran
class CreatePengeluaran extends StatefulWidget {
  ///Konstruktor kelas CreatePengeluaran
  const CreatePengeluaran({Key? key}) : super(key: key);

  ///Metode createState untuk membuat state baru dari widget CreatePengeluaran
  @override
  State<CreatePengeluaran> createState() => _CreatePengeluaranState();
}

///Kelas _CreatePengeluaranState adalah state dari widget CreatePengeluaran
class _CreatePengeluaranState extends State<CreatePengeluaran> {
  ///Objek pengeluaranController untuk mengelola logika pengeluaran
  final pengeluaranController = PengeluaranController();

  ///GlobalKey untuk mengakses dan memanipulasi FormState
  final _formkey = GlobalKey<FormState>();

  ///Variabel-variabel untuk menyimpan data dari input pengguna
  String? selectedDate;
  String? namabarang;
  String? hargabarang;

  ///Controller untuk mengelola input tanggal
  final TextEditingController _tanggalController = TextEditingController();

  ///Metode build untuk membangun antarmuka pengguna halaman tambah pengeluaran
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar untuk menampilkan judul halaman
      appBar: AppBar(
        backgroundColor: const Color(0xFFD9D9D9),
        centerTitle: true,
        title: Text(
          'Tambahkan Pengeluaran', // Judul halaman
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // Body dari halaman
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 350,
              height: 520,
              // Dekorasi untuk memberikan warna dan bentuk pada container
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Form(
                key: _formkey, // Menghubungkan GlobalKey dengan Form
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Bagian untuk memasukkan tanggal pengeluaran
                      // ...
                      // Bagian untuk memasukkan nama barang
                      // ...
                      // Bagian untuk memasukkan harga barang
                      // ...
                      // Tombol untuk menyimpan pengeluaran
                      ElevatedButton(
                        onPressed: () {
                          // Validasi input pengguna
                          if (_formkey.currentState!.validate()) {
                            // Membuat objek PengeluaranModel dari input pengguna
                            PengeluaranModel pm = PengeluaranModel(
                              selectedDate: selectedDate!,
                              namabarang: namabarang!,
                              hargabarang: hargabarang!,
                            );
                            // Menambahkan pengeluaran ke database melalui pengeluaranController
                            pengeluaranController.addPengeluaran(pm);
                            // Menampilkan pesan notifikasi bahwa pengeluaran telah ditambahkan
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Pengeluaran Ditambahkan'),
                              ),
                            );
                            // Menutup halaman tambah pengeluaran setelah pengeluaran ditambahkan
                            Navigator.pop(context, true);
                          }
                        },
                        // Mengonfigurasi tampilan tombol simpan
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF454BE0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          minimumSize: const Size(150, 50),
                        ),
                        child: const Text(
                          'Simpan', // Teks pada tombol
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
