import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiKey = ''; // Your RajaOngkir API key

  Future<List<Map<String, dynamic>>> fetchProvinces() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.rajaongkir.com/starter/province'),
        headers: {'key': apiKey},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return List<Map<String, dynamic>>.from(data['rajaongkir']['results']);
      } else {
        throw Exception('Failed to load provinces');
      }
    } catch (e) {
      throw Exception('Error fetching provinces: $e');
    }
  }

  Future<List<Map<String, dynamic>>> fetchCities(String provinceId) async {
    try {
      final response = await http.get(
        Uri.parse('https://api.rajaongkir.com/starter/city?province=$provinceId'),
        headers: {'key': apiKey},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return List<Map<String, dynamic>>.from(data['rajaongkir']['results']);
      } else {
        throw Exception('Failed to load cities');
      }
    } catch (e) {
      throw Exception('Error fetching cities: $e');
    }
  }

  Future<int> getShippingCost({
    required String origin,
    required String destination,
    required int weight,
    required String courier,
  }) async {
    try {
      final url = Uri.parse('https://api.rajaongkir.com/starter/cost');
      final response = await http.post(
        url,
        body: {
          'origin': origin,
          'destination': destination,
          'weight': weight.toString(),
          'courier': courier,
        },
        headers: {'key': apiKey},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['rajaongkir']['results'][0]['costs'][0]['cost'][0]['value'];
      } else {
        throw Exception('Failed to calculate shipping cost');
      }
    } catch (e) {
      throw Exception('Error calculating shipping cost: $e');
    }
  }
}
