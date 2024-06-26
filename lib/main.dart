import 'package:e_commerce/core/color.dart';
import 'package:e_commerce/view/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(Ecommerce());
}

class Ecommerce extends StatelessWidget {
  const Ecommerce({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Ecommerce',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        home: const Homescreen()
        // getPages: route
        );
  }
}
