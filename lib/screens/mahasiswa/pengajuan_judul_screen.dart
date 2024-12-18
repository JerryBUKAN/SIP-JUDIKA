import 'package:flutter/material.dart';

class PengajuanJudulScreen extends StatelessWidget {
  final TextEditingController judulController = TextEditingController();
  final TextEditingController objekPenelitianController = TextEditingController();
  final TextEditingController latarBelakangController = TextEditingController();
  final TextEditingController tujuanPenelitianController = TextEditingController();
  final TextEditingController pembimbing1Controller = TextEditingController();
  final TextEditingController pembimbing2Controller = TextEditingController();
  final TextEditingController daftarPustakaController = TextEditingController();

  PengajuanJudulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pengajuan Judul Skripsi",
          style: TextStyle(color: Colors.white), // Warna teks putih untuk judul AppBar
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Ikon kembali putih
          onPressed: () {
            // Kembali ke halaman Dashboard setelah klik panah kembali
            Navigator.pushReplacementNamed(context, '/dashboard');
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [const Color.fromARGB(255, 251, 251, 251), Colors.teal.shade300],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                _buildTextField(judulController, "Judul Skripsi"),
                _buildTextField(objekPenelitianController, "Objek Penelitian"),
                _buildTextField(latarBelakangController, "Latar Belakang", maxLines: 5),
                _buildTextField(tujuanPenelitianController, "Tujuan Penelitian", maxLines: 3),
                _buildTextField(pembimbing1Controller, "Usulan Pembimbing 1"),
                _buildTextField(pembimbing2Controller, "Usulan Pembimbing 2"),
                _buildTextField(daftarPustakaController, "Daftar Pustaka Utama", maxLines: 3),
                const SizedBox(height: 24),
                _buildSubmitButton(context),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Membuat TextField dengan tampilan lebih modern
  Widget _buildTextField(TextEditingController controller, String label, {int maxLines = 1}) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: TextField(
          controller: controller,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          maxLines: maxLines,
        ),
      ),
    );
  }

  // Tombol Kirim
  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Judul Skripsi telah diajukan!")),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 59, 127, 170),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadowColor: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
        elevation: 6,
      ),
      child: const Text(
        "Kirim",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)), // Teks tombol putih
      ),
    );
  }
}
