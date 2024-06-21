import 'package:flutter/material.dart';
import 'package:fashionshop/home_screen.dart';
import 'package:fashionshop/models.dart';
import 'package:fashionshop/checkout_screen.dart'; // Sesuaikan dengan nama file dan lokasi yang benar

class CartScreen extends StatefulWidget {
  final SelectedProduct selectedProduct;

  CartScreen({required this.selectedProduct});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _quantity = 1;
  bool _isChecked = false;
  int _checkedItemCount = 0;
  double _totalPrice = 0.0;

  @override
  void initState() {
    super.initState();
    // Inisialisasi _quantity dengan nilai dari widget.selectedProduct.quantity
    _quantity = widget.selectedProduct.quantity;
    // Hitung total harga berdasarkan harga produk dan jumlahnya
    _totalPrice = widget.selectedProduct.price;
  }

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Konfirmasi Hapus"),
          content: Text("Apakah Anda yakin ingin menghapus produk dari keranjang?"),
          actions: [
            TextButton(
              child: Text("Batal"),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
            ),
            TextButton(
              child: Text("Hapus"),
              onPressed: () {
                _clearSelectedProduct(); // Lakukan penghapusan data di sini
                Navigator.of(context).pop(); // Tutup dialog
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomeScreen()), // Navigasi ke HomeScreen dan hapus halaman lainnya
                  (Route<dynamic> route) => false, // Hapus semua halaman lain dari tumpukan
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _clearSelectedProduct() {
    // Hapus data produk dari keranjang
    setState(() {
      _isChecked = false;
      _checkedItemCount = 0;
      // Tidak perlu mengatur ulang _quantity atau _totalPrice karena tetap menunjukkan data dari sebelumnya
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                        if (_isChecked) {
                          _checkedItemCount = 1;
                          _totalPrice = widget.selectedProduct.price;
                        } else {
                          _checkedItemCount = 0;
                          _totalPrice = 0.0;
                        }
                      });
                    },
                  ),
                  SizedBox(height: 5),
                ],
              ),
              SizedBox(width: 3),
              Expanded(
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildProductImage(widget.selectedProduct.productImage),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${widget.selectedProduct.productName}',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(height: 5),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      '${widget.selectedProduct.selectedSize}, ${widget.selectedProduct.selectedColor}',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: 111,
                                    height: 27,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Jumlah: $_quantity',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Rp.${(_totalPrice).toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Color(0xFFEF6969),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _showDeleteConfirmationDialog(); // Panggil fungsi untuk menampilkan dialog konfirmasi
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke CheckoutScreen saat tombol Checkout ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutScreen(selectedProduct: widget.selectedProduct),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFEF6969)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width: 270,
                  height: 30,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Checkout ($_checkedItemCount) - Rp ${_totalPrice.toStringAsFixed(1)}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(String imagePath) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
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
    );
  }
}
