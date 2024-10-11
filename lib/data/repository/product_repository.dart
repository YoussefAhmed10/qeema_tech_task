import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:qeema_tech_task/data/models/product_model.dart';

class ProductRepository {
  static const String apiUrl = 'https://api.escuelajs.co/api/v1/products';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
