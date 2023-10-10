/// Mengimpor paket yang diperlukan
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:redlenshoescleaning/view/splashscreen.dart';

/// Fungsi utama, titik masuk aplikasi
Future main() async {
  /// Pastikan bahwa binding Flutter telah diinisialisasi
  WidgetsFlutterBinding.ensureInitialized();

  /// Inisialisasi Firebase
  await Firebase.initializeApp();

  /// Menjalankan aplikasi dengan widget MyApp
  runApp(const MyApp());
}

/// Kelas MyApp, mewakili widget utama aplikasi
class MyApp extends StatelessWidget {
  /// Konstruktor untuk kelas MyApp, dengan parameter key opsional
  const MyApp({Key? key});

  /// Metode build untuk membangun pohon widget
  @override
  Widget build(BuildContext context) {
    /// MaterialApp, mengonfigurasi tampilan keseluruhan aplikasi
    return MaterialApp(
      /// Judul aplikasi yang ditampilkan pada switcher tugas OS
      title: 'Flutter Demo',

      /// Menonaktifkan banner debug di sudut kanan atas
      debugShowCheckedModeBanner: false,

      /// Tema aplikasi untuk menyesuaikan properti visual
      theme: ThemeData(
        /// Menentukan skema warna dengan warna seed tertentu
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD9D9D9),
        ),

        /// Mengaktifkan fitur desain Material 3
        useMaterial3: true,
      ),

      /// Rute awal aplikasi, menampilkan widget SplashScreen
      home: const SplashScreen(),
    );
  }
}
