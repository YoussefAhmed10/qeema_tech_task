import 'dart:typed_data';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:qeema_tech_task/data/models/product_model.dart';

class ProductRepository {
  static const String apiUrl = 'https://api.escuelajs.co/api/v1/products';
  static const String productBoxName = 'products';
  Future<List<Product>> fetchProducts() async {
    var productBox = await Hive.openBox<Product>(productBoxName);
    if (productBox.isNotEmpty) {
      // Return cached products
      return productBox.values.toList();
    } else {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        List<Product> products = [];

        for (var json in jsonData) {
          Product product = Product.fromJson(json);

          // Download the images as bytes
          List<Uint8List> imageBytes = await _downloadImages(product.images);

          // Save images bytes along with the product data
          product = Product(
            id: product.id,
            title: product.title,
            price: product.price,
            description: product.description,
            images: product.images,
            imageBytes: imageBytes,
            category: product.category,
          );

          products.add(product);
          productBox.put(product.id, product);
        }
        return products;
      } else {
        throw Exception('Failed to load products');
      }
    }
  }

  Future<List<Uint8List>> _downloadImages(List<String> imageUrls) async {
    List<Uint8List> imageBytes = [];

    for (String url in imageUrls) {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        imageBytes.add(response.bodyBytes); // Save the image bytes
      }
    }

    return imageBytes;
  }
}
