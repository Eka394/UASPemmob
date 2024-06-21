import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Buat daftar status switch untuk setiap notifikasi
  List<bool> _switchValues = List.generate(7, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context, int index) {
          // Buat daftar notifikasi
          final List<String> notifikasi = [
            'Pembaruan Produk Baru',
            'Ada Seri Pakaian Baru',
            'Ada Penurunan Harga',
            'Peringatan Keamanan',
            'Penawaran Eksklusif',
            'Pembaruan Aplikasi',
            'Tips dan Layanan Baru Tersedia'
          ];

          return ListTile(
            title: Text(
              notifikasi[index],
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
            ),
            trailing: Switch(
              value: _switchValues[index],
              onChanged: (bool value) {
                setState(() {
                  _switchValues[index] = value;
                });
              },
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          // Tambahkan garis pemisah di antara setiap elemen daftar
          return Divider();
        },
        itemCount: 7, // Jumlah item dalam daftar notifikasi
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NotificationScreen(),
  ));
}
