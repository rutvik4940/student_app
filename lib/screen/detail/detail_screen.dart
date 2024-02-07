import 'package:core_exma/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/global.dart';

class DatailScreen extends StatefulWidget {
  const DatailScreen({super.key});

  @override
  State<DatailScreen> createState() => _DatailScreenState();
}

class _DatailScreenState extends State<DatailScreen> {
  TextEditingController student_name = TextEditingController();
  TextEditingController student_grid = TextEditingController();
  TextEditingController student_standerd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("AddData"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Student List",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: student_name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Enter the student name..."),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: student_grid,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Enter the student grid..."),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: student_standerd,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Enter the student standard..."),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          model data = model(
            student_name: student_name.text,
            student_grid: student_grid.text,
            student_standard: student_standerd.text,
          );
           Global.g1.dataList.add(data);
          Navigator.pop(context);
        },
        child: const Icon(Icons.save_alt),
      ),
    ),
    );
  }
}



