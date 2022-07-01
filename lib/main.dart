import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_todo_app/screens/todo_scree.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(GetMaterialApp(
    // theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}
