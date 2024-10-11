import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qeema_tech_task/data/models/product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.product.title,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              '\$${widget.product.price}',
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 10.h),
            Text(widget.product.description),
            SizedBox(height: 20.h),
            Text(
              'Category: ${widget.product.category}',
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.product.images.length,
                itemBuilder: (context, index) {
                  final imageUrl = widget.product.images[index];
                  log(imageUrl);
                  return Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: Image.network(
                      widget.product.images[index]
                          .replaceAll(RegExp(r'[\/[\/]\/"]'), ''),
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.error,
                        // size: 70,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
