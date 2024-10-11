import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:qeema_tech_task/data/models/product_model.dart';
import 'package:qeema_tech_task/data/repository/product_repository.dart';

class ProductProvider with ChangeNotifier {
  List<Product> products = [];
  String? error;
  bool isLoading = false;
  ProductRepository productRepository = ProductRepository();

  Future<List<Product>> fetchProducts({
    bool? isStart,
  }) async {
    log(products.toString(), name: 'fetchProducts1');
    isLoading = true;
    isStart == false ? null : notifyListeners();
    log(products.toString(), name: 'fetchProducts2');
    try {
      var getProducts = await productRepository.fetchProducts();
      log(getProducts.toString(), name: 'fetchProducts4');
      products = getProducts;
      log(products.toString(), name: 'fetchProducts3');
      notifyListeners();
      isLoading = false;
      notifyListeners();
      return products;
    } catch (e) {
      print(e.toString());
      print(error = e.toString());
      isLoading = false;
      notifyListeners();
      return [];
    }
  }
}
