import 'package:flutter/material.dart';

class PengajuanJudulScreen extends StatelessWidget {
  final TextEditingController judulController = TextEditingController();
  final TextEditingController objekPenelitianController = TextEditingController();
  final TextEditingController latarBelakangController = TextEditingController();
  final TextEditingController tujuanPenelitianController = TextEditingController();
  final TextEditingController pembimbing1Controller = TextEditingController();
  final TextEditingController pembimbing2Controller = TextEditingController();
  final TextEditingController daftarPustakaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pengajuan Judul Skripsi"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTextField(judulController, "Judul Skripsi"),
              _buildTextField(objekPenelitianController, "Objek Penelitian"),
              _buildTextField(latarBelakangController, "Latar Belakang", maxLines: 5),
              _buildTextField(tujuanPenelitianController, "Tujuan Penelitian", maxLines: 3),
              _buildTextField(pembimbing1Controller, "Usulan Pembimbing 1"),
              _buildTextField(pembimbing2Controller, "Usulan Pembimbing 2"),
              _buildTextField(daftarPustakaController, "Daftar Pustaka Utama", maxLines: 3),
              SizedBox(height: 24),
              _buildSubmitButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {int maxLines = 1}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Colors.blueAccent),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          maxLines: maxLines,
        ),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Logic pengajuan
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Judul Skripsi telah diajukan!")),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        "Kirim",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
