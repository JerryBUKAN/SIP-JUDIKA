import 'package:flutter/material.dart';
import 'package:sip_judika/screens/admin/dashboard_admin.dart';
import 'package:sip_judika/screens/admin/detail_judul_admin.dart';

class DaftarJudulAdmin extends StatelessWidget {
  final List<Map<String, String>> pengajuan = [
    {
      "judul": "Judul 1",
      "status": "Proses",
      "keterangan": "Menunggu persetujuan."
    },
    {
      "judul": "Judul 2",
      "status": "Disetujui",
      "keterangan": "Judul sudah diterima."
    },
  ];

  DaftarJudulAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Daftar Judul",
          style: TextStyle(
              color: Color.fromARGB(
                  255, 252, 252, 252)), // Mengubah warna teks menjadi putih
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.white), // Tombol kembali dengan warna putih
          onPressed: () {
            // Kembali ke halaman Dashboard setelah klik panah kembali
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const DashboardAdminScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: pengajuan.length,
          itemBuilder: (context, index) {
            final item = pengajuan[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Judul pengajuan
                    Text(
                      item["judul"]!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Status dan keterangan
                    Text(
                      "${item["status"]!}: ${item["keterangan"]!}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Tombol Lihat Detail
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        // onPressed: () {
                        //   // Implementasikan aksi untuk melihat detail
                        //   showDialog(
                        //     context: context,
                        //     builder: (context) {
                        //       return AlertDialog(
                        //         title: const Text("Detail Pengajuan"),
                        //         content: Text(
                        //             "Menampilkan detail untuk ${item["judul"]!}."),
                        //         actions: <Widget>[
                        //           TextButton(
                        //             child: const Text("Tutup"),
                        //             onPressed: () {
                        //               Navigator.of(context).pop();
                        //             },
                        //           ),
                        //         ],
                        //       );
                        //     },
                        //   );
                        // },
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DetailJudulAdmin()),
                          );
                        },
                        child: const Text(
                          "Lihat Detail",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
