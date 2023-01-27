import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyWidget{
  static const storage = FlutterSecureStorage();

  static EdgeInsets paddingSize() {
    return const EdgeInsets.all(8);
  }
}