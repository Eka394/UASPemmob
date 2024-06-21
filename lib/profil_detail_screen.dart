import 'package:flutter/material.dart';

class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  _ProfileDetailScreenState createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  // Variabel untuk melacak apakah pengguna sedang dalam mode pengeditan atau tidak
  bool isEditing = false;

  // Variabel untuk menyimpan nilai yang akan diubah oleh pengguna
  late String fullName;
  late String username;
  late String email;
  late String phoneNumber;
  late String dateOfBirth;
  late String streetAddress;

  // Inisialisasi nilai variabel saat initState dipanggil
  @override
  void initState() {
    super.initState();
    fullName = 'Lyin Putri';
    username = 'Lyin12';
    email = 'lyin12@gmail.com';
    phoneNumber = '+1234567890';
    dateOfBirth = 'January 1, 1990';
    streetAddress = 'Jl. Mandiri, Surabaya';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        actions: [
          // Tambahkan ikon edit di AppBar
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Ketika ikon edit diklik, ubah variabel isEditing menjadi true
              setState(() {
                isEditing = true;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/user1.jpg'), // Ganti dengan foto profil yang sesuai
              ),
            ),
            SizedBox(height: 20),
            _buildProfileItem(label: 'Full Name', value: fullName),
            _buildProfileItem(label: 'Username', value: username),
            _buildProfileItem(label: 'Email', value: email),
            _buildProfileItem(label: 'Phone Number', value: phoneNumber),
            _buildProfileItem(label: 'Date of Birth', value: dateOfBirth),
            _buildProfileItem(label: 'Street Address', value: streetAddress),
            // Tampilkan tombol 'Simpan' hanya jika sedang dalam mode pengeditan
            if (isEditing) ...[
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  // Simpan perubahan dan kembali ke mode tampilan saja
                  setState(() {
                    isEditing = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Warna latar belakang tombol
                    
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(
                    'Simpan',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white, // Warna teks tombol
                    ),
                  ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          // Gunakan TextFormField hanya jika sedang dalam mode pengeditan
          isEditing
              ? TextFormField(
                  initialValue: value,
                  onChanged: (newValue) {
                    // Perbarui nilai variabel yang sesuai saat pengguna mengubah teks
                    setState(() {
                      if (label == 'Full Name') {
                        fullName = newValue;
                      } else if (label == 'Username') {
                        username = newValue;
                      } else if (label == 'Email') {
                        email = newValue;
                      } else if (label == 'Phone Number') {
                        phoneNumber = newValue;
                      } else if (label == 'Date of Birth') {
                        dateOfBirth = newValue;
                      } else if (label == 'Street Address') {
                        streetAddress = newValue;
                      }
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                )
              : Text(
                  value,
                  style: TextStyle(fontSize: 17),
                ),
          // Gunakan Container dengan warna garis sebagai gantinya
          if (!isEditing)
            Container(
              height: 1,
              color: Colors.grey[300],
              margin: EdgeInsets.only(top: 15.0),
            ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
