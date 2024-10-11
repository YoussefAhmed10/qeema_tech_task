import 'package:flutter/material.dart';
import 'package:qeema_tech_task/data/models/product_model.dart';
import 'package:qeema_tech_task/data/repository/product_repository.dart';

class ProductProvider with ChangeNotifier {
  final ProductRepository _productRepository = ProductRepository();

  List<Product>? _products;
  Product? _selectedProduct;
  bool _isLoading = false;
  String? _errorMessage;

  List<Product>? get products => _products;
  Product? get selectedProduct => _selectedProduct;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<List<Product>> fetchProducts({bool? isStart}) async {
    _isLoading = true;
    isStart == false ? null : notifyListeners();
    _errorMessage = null;
    try {
      var getProducts = await _productRepository.fetchProducts();
      _products = getProducts;
      notifyListeners();
      _isLoading = false;
      notifyListeners();
      return _products!;
    } catch (error) {
      _errorMessage = error.toString();
      _isLoading = false;
      notifyListeners();
      return [];
    }
  }
}
