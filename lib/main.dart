// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool check(var numble) {
    if (numble < 2) {
      return false;
    } else {
      for (int i = 2; i < numble; i++) {
        if (numble % i == 0) {
          return false;
        }
      }
    }
    return true;
  }

  TextEditingController numbleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              child: TextField(
                controller: numbleController,
                decoration: InputDecoration(
                    hintText: "Nhập số bạn muốn kiểm tra",
                    hintStyle: TextStyle(
                      fontSize: 18,
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  var result = "";
                  int? numble = int.tryParse(numbleController.text);
                  if (numbleController.text.isEmpty) {
                    result = "Bạn chưa nhập giá trị";
                  } else if (numble == null) {
                    result = "Nhập đúng giá trị ";
                  } else {
                    bool _check = check(numble);
                    if (_check == true) {
                      result = "Số $numble là số nguyên tố";
                    } else
                      result = "Số $numble không là số nguyên tố";
                  }
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(result)));
                },
                child: Text(
                  "Kiểm Tra",
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}
