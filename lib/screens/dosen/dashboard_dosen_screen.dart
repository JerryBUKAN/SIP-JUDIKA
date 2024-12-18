import 'package:flutter/material.dart';
import 'package:sip_judika/widget/dosen_drawer.dart';

class DashboardDosenScreen extends StatelessWidget {
  final bool isJudulSubmitted = false;

  const DashboardDosenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // AppBar tetap hitam
        iconTheme: const IconThemeData(
          color: Colors.white, // Ubah garis tiga menjadi putih
        ),
      ),
      drawer: const DosenDrawer(), // Menggunakan DosenDrawer saja
      body: const Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul utama panel dashboard
            const Text(
              "PANEL DASHBOARD DOSEN",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87, // Warna teks utama
              ),
            ),
            const SizedBox(height: 8),
            // Tambahkan teks selamat datang
            const Text(
              "Selamat Datang, Dosen!",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black54, // Warna teks lebih lembut
              ),
            ),
            const SizedBox(height: 16),
            // Panel dengan background abu-abu terang
            // Expanded(
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: const Color.fromARGB(255, 244, 244, 244), // Warna abu-abu terang
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //     padding: const EdgeInsets.all(16),
            //     child: GridView.builder(
            //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 3, // Jumlah kolom
            //         crossAxisSpacing: 16,
            //         mainAxisSpacing: 16,
            //         childAspectRatio: 0.9, // Proporsi kartu tetap
            //       ),
            //       itemCount: 1, // Jumlah kartu (bisa ditambah sesuai kebutuhan)
            //       itemBuilder: (context, index) {
            //         return _buildMenuCard(
            //           icon: Icons.edit,
            //           color: Colors.orangeAccent, // Warna berbeda untuk card
            //           label: isJudulSubmitted
            //               ? "Lihat Status Pengajuan Judul"
            //               : "Ajukan Judul Skripsi",
            //           onTap: () {
            //             // Navigator.push(
            //             //   context,
            //             //   MaterialPageRoute(
            //             //     builder: (context) => isJudulSubmitted
            //             //         ? StatusPengajuanScreen()
            //             //         : PengajuanJudulScreen(),
            //             //   ),
            //             // );
            //           },
            //         );
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // Fungsi pembantu untuk membangun menu
  Widget _buildMenuCard({
    required IconData icon,
    required Color color,
    required String label,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color, // Warna tetap sesuai parameter
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36, color: Colors.white),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
