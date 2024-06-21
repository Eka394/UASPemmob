import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? _selectedPembayaran;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Metode Pembayaran'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0), // Padding untuk seluruh daftar
        children: [
          _buildPaymentMethodTile('GoPay'),
          _buildPaymentMethodTile('OVO'),
          _buildPaymentMethodTile('DANA'),
          _buildPaymentMethodTile('LinkAja'),
          _buildPaymentMethodTile('ShopeePay'),
          _buildPaymentMethodTile('BNI'),
          _buildPaymentMethodTile('BRI'),
          _buildPaymentMethodTile('BCA'),
          _buildPaymentMethodTile('COD'),
        ],
      ),
      bottomNavigationBar: _selectedPembayaran != null
          ? Container(
              padding: EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  int handlingFee = _selectedPembayaran == 'COD' ? 2000 : 1000;
                  Navigator.pop(
                    context,
                    {
                      'paymentMethod': _selectedPembayaran,
                      'handlingFee': handlingFee,
                    },
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFEf6969)),
                ),
                child: Text(
                  'Pilih',
                  style: TextStyle(
                    color: Colors.white, // Mengatur warna teks menjadi putih
                  ),
                ),
              ),
            )
          : null,
    );
  }

  Widget _buildPaymentMethodTile(String paymentMethod) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: _selectedPembayaran == paymentMethod ? Colors.purple : Colors.grey, // Tentukan warna border
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: RadioListTile(
          title: Text(paymentMethod),
          value: paymentMethod,
          groupValue: _selectedPembayaran,
          onChanged: (value) {
            setState(() {
              _selectedPembayaran = value as String?;
            });
          },
        ),
      ),
    );
  }
}
