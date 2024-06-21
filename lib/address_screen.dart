import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'api_service.dart';

class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String phoneNumber = '';
  String address = '';
  String? selectedProvince;
  String? selectedCity;
  String? selectedCityId; // Store city_id of the selected city

  List<Map<String, dynamic>> provinces = [];
  List<Map<String, dynamic>> cities = [];

  ApiService apiService = ApiService(); // Initialize ApiService without apiKey

  @override
  void initState() {
    super.initState();
    fetchProvinces();
  }

  Future<void> fetchProvinces() async {
    try {
      final provincesData = await apiService.fetchProvinces();
      setState(() {
        provinces = provincesData;
      });
    } catch (e) {
      print('Error fetching provinces: $e');
    }
  }

  Future<void> fetchCities(String provinceName) async {
    try {
      final provinceId = provinces.firstWhere((province) => province['province'] == provinceName)['province_id'];
      final citiesData = await apiService.fetchCities(provinceId);
      setState(() {
        cities = citiesData;
        selectedCity = null; // Reset selected city
      });
    } catch (e) {
      print('Error fetching cities: $e');
    }
  }

  Future<void> _calculateShippingCost() async {
    try {
      final cost = await apiService.getShippingCost(
        origin: 'Surabaya', // Example origin city
        destination: selectedCityId!, // Use selected city_id as destination
        weight: 1000, // Example weight in grams
        courier: 'jne', // Example courier
      );
      print('Biaya Pengiriman: $cost');
    } catch (e) {
      print('Error calculating shipping cost: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Isi Alamat Pengiriman'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nama'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    name = value ?? '';
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'No. Telepon'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'No. Telepon tidak boleh kosong';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    phoneNumber = value ?? '';
                  },
                ),
                DropdownButtonFormField<String>(
                  value: selectedProvince,
                  onChanged: (value) {
                    setState(() {
                      selectedProvince = value;
                      selectedCity = null; // Reset city when province changes
                      cities.clear(); // Clear city list
                      fetchCities(value!);
                    });
                  },
                  items: provinces.map((Map<String, dynamic> province) {
                    return DropdownMenuItem<String>(
                      value: province['province'],
                      child: Text(province['province']),
                    );
                  }).toList(),
                  decoration: InputDecoration(labelText: 'Provinsi'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Provinsi tidak boleh kosong';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    selectedProvince = value!;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: selectedCity,
                  onChanged: selectedProvince == null ? null : (value) {
                    final selectedCityData = cities.firstWhere((city) => city['city_name'] == value);
                    setState(() {
                      selectedCity = value;
                      selectedCityId = selectedCityData['city_id']; // Store city_id of selected city
                    });
                  },
                  items: cities.map((Map<String, dynamic> city) {
                    return DropdownMenuItem<String>(
                      value: city['city_name'],
                      child: Text(city['city_name']),
                    );
                  }).toList(),
                  decoration: InputDecoration(labelText: 'Kabupaten/Kota'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kabupaten/Kota tidak boleh kosong';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    selectedCity = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Alamat'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Alamat tidak boleh kosong';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    address = value ?? '';
                  },
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        _calculateShippingCost(); // Call function to calculate shipping cost
                        Navigator.pop(context, {
                          'name': name,
                          'phoneNumber': phoneNumber,
                          'address': address,
                          'province': selectedProvince,
                          'city': selectedCity,
                        });
                      }
                    },
                    child: Text('Simpan Alamat'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
