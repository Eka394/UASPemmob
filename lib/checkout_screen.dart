import 'package:fashionshop/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fashionshop/address_screen.dart';
import 'package:fashionshop/payment_screen.dart';
import 'package:fashionshop/models.dart';
import 'package:fashionshop/api_service.dart';

class CheckoutScreen extends StatefulWidget {
  final SelectedProduct selectedProduct;

  CheckoutScreen({required this.selectedProduct});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String? selectedPaymentMethod;
  String? selectedDeliveryMethod;
  String? addressName;
  String? addressPhoneNumber;
  String? addressDetail;
  String? selectedProvince;
  String? selectedCity;
  String? selectedCityId; // Tambah variabel untuk menyimpan city_id yang dipilih
  int handlingFee = 0;
  double shippingFee = 0; // Biaya pengiriman dari API
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    // Set default delivery method to 'Regular'
    selectedDeliveryMethod = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAddressSection(),
                  _buildOrderSection(),
                  _buildPaymentSection(),
                  _buildDeliverySection(),
                  SizedBox(height: 20),
                  _buildOrderSummarySection(),
                ],
              ),
            ),
          ),
          _buildBottomButton(),
        ],
      ),
    );
  }

  Widget _buildAddressSection() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Alamat Pengiriman',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddressScreen(),
                      ),
                    );

                    if (result != null) {
                      setState(() {
                        addressName = result['name'];
                        addressPhoneNumber = result['phoneNumber'];
                        addressDetail = result['address'];
                        selectedProvince = result['province'];
                        selectedCity = result['city'];
                        selectedCityId = result['city_id']; // Simpan city_id yang dipilih
                        // Calculate shipping cost when address is updated
                        _calculateShippingCost();
                      });
                    }
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.chevron_right),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[400],
            ),
            SizedBox(height: 15),
            if (addressDetail != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        addressName!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '($addressPhoneNumber)',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '$addressDetail, $selectedCity, $selectedProvince',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              )
            else
              Text(
                'Tambahkan alamat pengiriman Anda di sini...',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSection() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.shopping_bag,
                  color: Colors.black,
                ),
                SizedBox(width: 15),
                Text(
                  'Pesanan Anda',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[400],
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.selectedProduct.productImage),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.selectedProduct.productName,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${widget.selectedProduct.selectedSize}, ${widget.selectedProduct.selectedColor}',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Jumlah: ${widget.selectedProduct.quantity}',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Rp.${widget.selectedProduct.price}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentSection() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.payment,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Metode Pembayaran',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentScreen(),
                      ),
                    );

                    if (result != null) {
                      setState(() {
                        selectedPaymentMethod = result['paymentMethod'];
                        handlingFee = result['handlingFee'];
                      });
                    }
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.chevron_right),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[400],
            ),
            SizedBox(height: 15),
            if (selectedPaymentMethod != null)
              Text(
                selectedPaymentMethod!,
                style: TextStyle(fontSize: 16, color: Colors.black),
              )
            else
              Text(
                'Pilih metode pembayaran...',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliverySection() {
    List<String> deliveryMethods = ['JNE', 'POS', 'TIKI'];

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.delivery_dining,
                  color: Colors.black,
                ),
                SizedBox(width: 10),
                Text(
                  'Metode Pengiriman',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[400],
            ),
            SizedBox(height: 15),
            DropdownButtonFormField<String>(
              value: selectedDeliveryMethod,
              items: deliveryMethods.map((String method) {
                return DropdownMenuItem<String>(
                  value: method,
                  child: Text(method),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedDeliveryMethod = newValue;
                  if (selectedDeliveryMethod == 'JNE') {
                    shippingFee = 5000;
                  } else if (selectedDeliveryMethod == 'POS') {
                    shippingFee = 7000;
                  } else if (selectedDeliveryMethod == 'TIKI') {
                    shippingFee = 6000;
                  } else {
                    shippingFee = 0;
                  }
                });
              },
              decoration: InputDecoration(
                hintText: 'Pilih metode pengiriman...',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildOrderSummarySection() {
    int totalPrice = (widget.selectedProduct.price + handlingFee + shippingFee).toInt();


    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ringkasan Pesanan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[400],
            ),
            SizedBox(height: 15),
            _buildSummaryItem('Total Harga', 'Rp.${widget.selectedProduct.price }'),
            _buildSummaryItem('Biaya Layanan', 'Rp.$handlingFee'),
            _buildSummaryItem('Biaya Pengiriman', 'Rp.$shippingFee'),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[400],
            ),
            SizedBox(height: 10),
            _buildSummaryItem('Total Pembayaran', 'Rp.$totalPrice', isTotal: true),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String title, String value, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, color: isTotal ? Colors.black : Colors.grey),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal, color: isTotal ? Colors.black : Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: _placeOrder,
        child: Text(
          'Konfirmasi Pesanan',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFDB3022), // Set the button color
          minimumSize: Size(double.infinity, 50),
        ),
      ),
    );
  }

  void _calculateShippingCost() async {
    if (selectedCityId != null) {
      // You need to replace 'API_KEY' with your actual RajaOngkir API key
      String apiKey = 'c6e19d3b417cee3aab736e382fc87d0a'; // Ganti dengan API Key RajaOngkir Anda
      String url = 'https://api.rajaongkir.com/starter/cost';
      
      Map<String, String> headers = {
        'key': apiKey,
        'Content-Type': 'application/x-www-form-urlencoded',
      };
      
      Map<String, dynamic> body = {
        'origin': '501', // Ganti dengan kode kota asal sesuai dengan RajaOngkir
        'destination': selectedCityId!, // Gunakan city_id yang telah dipilih
        'weight': '1000', // Ganti dengan berat produk yang akan dikirim dalam gram
        'courier': selectedDeliveryMethod!.toLowerCase(), // Kurir yang dipilih, pastikan lowercase
      };

      try {
        final response = await http.post(Uri.parse(url), headers: headers, body: body);
        final responseJson = json.decode(response.body);
        final results = responseJson['rajaongkir']['results'][0]['costs'];

        setState(() {
          shippingFee = results[0]['cost'][0]['value'].toDouble();
        });
      } catch (e) {
        print('Error calculating shipping cost: $e');
        setState(() {
          shippingFee = 0;
        });
      }
    }
  }

  void _placeOrder() {
    // Implement your logic to place the order
    // Example: You can create an order object and send it to the backend
    // ApiService apiService = ApiService();
    // Order order = Order(
    //   productName: widget.selectedProduct.productName,
    //   quantity: widget.selectedProduct.quantity,
    //   price: widget.selectedProduct.price,
    //   selectedSize: widget.selectedProduct.selectedSize,
    //   selectedColor: widget.selectedProduct.selectedColor,
    //   total: calculateTotalPrice(),
    //   address: addressDetail,
    //   city: selectedCity,
    //   province: selectedProvince,
    //   paymentMethod: selectedPaymentMethod,
    //   deliveryMethod: selectedDeliveryMethod,
    // );
    // apiService.placeOrder(order);
    
    // Example: Show a confirmation dialog
    showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      title: Column(
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 60),
          SizedBox(height: 15),
          Text(
            'Pesanan Dikonfirmasi!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Pesanan Anda telah berhasil dikonfirmasi dan sedang diproses.',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'Terima kasih telah berbelanja.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        Center(
          child: Container(
            width: 200,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()), // Navigate to HomeScreen
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey[300]), // Grey background
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  },
);
  }
}
