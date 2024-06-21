import 'package:flutter/material.dart';

class PreferencesScreen extends StatefulWidget {
  @override
  _PreferencesScreenState createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  bool _downloadOverWifiOnly = false;
  bool _autoRotateScreen = false;
  bool _useHDResolution = false;
  bool _autoDownloadAudio = false;
  String _audioQuality = 'Standard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SwitchListTile(
            title: Text('Unduh Hanya Melalui Wi-Fi'),
            contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
            value: _downloadOverWifiOnly,
            onChanged: (bool value) {
              setState(() {
                _downloadOverWifiOnly = value;
              });
            },
          ),
          ListTile(
            title: Text('Bersihkan Sampah'),
            contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Konfirmasi'),
                    content: Text('Apakah Anda yakin ingin membersihkan sampah?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Tambahkan aksi untuk membersihkan sampah di sini
                        },
                        child: Text('Ya'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Tidak'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          Divider(),
          Text(
            'Image',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SwitchListTile(
            title: Text('Layar Putar Otomatis'),
            contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
            value: _autoRotateScreen,
            onChanged: (bool value) {
              setState(() {
                _autoRotateScreen = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Gunakan Resolusi HD untuk Tampilan yang Lebih Memuaskan'),
            contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
            value: _useHDResolution,
            onChanged: (bool value) {
              setState(() {
                _useHDResolution = value;
              });
            },
          ),
          Divider(),
          Text(
            'Audio',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Text('Kualitas Audio'),
            contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
            trailing: DropdownButton<String>(
              value: _audioQuality,
              onChanged: (String? newValue) {
                setState(() {
                  _audioQuality = newValue ?? _audioQuality;
                });
              },
              items: <String>['Standard', 'High', 'Low']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          SwitchListTile(
            title: Text('Unduh Audio Secara Otomatis'),
            contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
            value: _autoDownloadAudio,
            onChanged: (bool value) {
              setState(() {
                _autoDownloadAudio = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PreferencesScreen(),
  ));
}
