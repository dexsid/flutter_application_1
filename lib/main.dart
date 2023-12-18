import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: const Text("Бабочка"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: const Center(
        child: Text(
          "Пархает",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    ),
  ));
}
