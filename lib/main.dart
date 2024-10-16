import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qeema_tech_task/data/models/product_model.dart';
import 'package:qeema_tech_task/domain/providers/product_provider.dart';
import 'package:qeema_tech_task/presentation/pages/home_screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  await ScreenUtil.ensureScreenSize();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qeema Tech Task',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const ScreenUtilInit(
        designSize: Size(375, 812),
        child: HomeScreen(),
      ),
    );
  }
}
