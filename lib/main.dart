import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_pammob/providers/cart_provider.dart';
import 'package:tugas_pammob/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Saingan Tokped',
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}