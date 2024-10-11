import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qeema_tech_task/domain/providers/product_provider.dart';
import 'package:qeema_tech_task/presentation/pages/home_screen/widget/shimmer_product_card.dart';
import 'package:qeema_tech_task/presentation/pages/product_detail_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch the products when the screen loads
    context.read<ProductProvider>().fetchProducts(isStart: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: context.watch<ProductProvider>().isLoading
          ? SizedBox(
              height: 500.h,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    const ShimmerProductCardWidget(),
                itemCount: 5,
                separatorBuilder: (context, index) => SizedBox(height: 10.h),
              ),
            )
          : context.watch<ProductProvider>().errorMessage != null
              ? Center(
                  child: Text(
                    context.watch<ProductProvider>().errorMessage!,
                  ),
                )
              : Consumer<ProductProvider>(
                  builder: (context, productParams, _) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: productParams.products?.length ?? 0,
                      itemBuilder: (context, index) {
                        final product = productParams.products![index];
                        return ListTile(
                          leading: Image.network(
                            product.images[0],
                            fit: BoxFit.fill,
                            width: 70.w,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                              Icons.error,
                              size: 70,
                            ),
                          ),
                          title: Text(product.title),
                          subtitle: Text('\$${product.price.toString()}'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailScreen(product: product),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
    );
  }
}
