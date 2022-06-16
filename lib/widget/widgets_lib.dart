import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget factBot(BuildContext context) {
  return Container(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        child: Center(
          child: Icon(Icons.chat),
        ),
        elevation: 4.0,
        backgroundColor: Colors.pink,
        onPressed: () {},
      ));
}
