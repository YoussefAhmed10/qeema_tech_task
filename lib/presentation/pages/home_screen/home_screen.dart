import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qeema_tech_task/domain/providers/product_provider.dart';
import 'package:qeema_tech_task/presentation/pages/product_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Delay the fetch operation to ensure the widget is fully initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductProvider>().fetchProducts(isStart: false);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return const ProductListScreen();
  }
}
