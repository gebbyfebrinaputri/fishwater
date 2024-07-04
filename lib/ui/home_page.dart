import 'package:flutter/material.dart';
import 'IkanView.dart'; // Impor kelas IkanView
import 'admin_page.dart'; // Impor kelas AdminPage

class HomePage extends StatelessWidget {
  final bool isAdmin;

  const HomePage({Key? key, required this.isAdmin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Fish Water',
                style: TextStyle(
                  color: Colors.blueAccent, // Warna khusus untuk teks 'Fish Water'
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white, // Warna latar belakang AppBar tetap default
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: const IkanView(), // Menampilkan IkanView di dalam HomePage
          ),
          const SizedBox(height: 20),
          if (isAdmin) // Hanya tampilkan tombol untuk admin
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdminPage()), // Navigasi ke AdminPage
                );
              },
              child: const Text('Go to Admin Page'),
            ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Kembali ke halaman login
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
