import 'package:flutter/material.dart';
import 'package:route_task/ui/screens/product/product_screen.dart';
import 'config/di/di_generator.dart';
void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Route',
debugShowCheckedModeBanner: false,
      initialRoute: ProductScreen.routeName,
routes: {
  ProductScreen.routeName: (context) =>  ProductScreen(),
      },

    );
  }
}

