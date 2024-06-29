import 'dart:convert';
import 'package:e_commerce/model/product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://fakestoreapi.com';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$_baseUrl/products'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<String>> fetchCategories() async {
    final response = await http.get(Uri.parse('$_baseUrl/products/categories'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.cast<String>();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
