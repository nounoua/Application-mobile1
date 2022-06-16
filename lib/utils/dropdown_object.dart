import 'package:flutter/cupertino.dart';

class DropDownObject {
  String imageUrl;
  String name;

  DropDownObject({required this.imageUrl, required this.name});

  @override
  String toString() {
    return name;
  }
}
