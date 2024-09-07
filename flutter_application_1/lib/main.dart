import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController t = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: t,
                  keyboardType: TextInputType.datetime,
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Fill this field";
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      log(t.text);
                      print(_formKey.currentState!.validate());

                      if (_formKey.currentState!.validate()) {
                        print(t.text);
                      } else {
                        print("object");
                      }
                    },
                    child: Text("Submit"))
              ],
            )),
      ),
    );
  }
}
