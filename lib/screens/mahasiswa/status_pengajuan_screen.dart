import 'package:flutter/material.dart';

class StatusPengajuanScreen extends StatelessWidget {
  final List<Map<String, String>> pengajuan = [
    {"judul": "Judul 1", "status": "Proses", "keterangan": "Menunggu persetujuan."},
    {"judul": "Judul 2", "status": "Disetujui", "keterangan": "Judul sudah diterima."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Status Pengajuan"),
        backgroundColor: Colors.blueAccent,
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
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Judul pengajuan
                    Text(
                      item["judul"]!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Status dan keterangan
                    Text(
                      "${item["status"]!}: ${item["keterangan"]!}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 12),
                    // Tombol Lihat Detail
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          // Implementasikan aksi untuk melihat detail
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Detail Pengajuan"),
                                content: Text("Menampilkan detail untuk ${item["judul"]!}."),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text("Tutup"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text(
                          "Lihat Detail",
                          style: TextStyle(
                            color: Colors.blueAccent,
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
