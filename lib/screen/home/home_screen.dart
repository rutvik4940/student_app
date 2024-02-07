import 'package:core_exma/model/model.dart';
import 'package:flutter/material.dart';

import '../../utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  TextEditingController student_name = TextEditingController();
  TextEditingController student_grid = TextEditingController();
  TextEditingController student_standerd = TextEditingController();
  bool isGrid = true;
  List colorList=[Colors.primaries];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("home"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isGrid = !isGrid;
                  });
                },
                icon: Icon(isGrid ? Icons.grid_view_outlined : Icons.list)),
          ],
        ),
        body: isGrid
            ? ListView.builder(
          itemCount: Global.g1.dataList.length,
          itemBuilder: (context, index) {
            model data = Global.g1.dataList[index];
            return InkWell(
              onDoubleTap: () {
                setState(() {
                  Global.g1.dataList.removeAt(index);
                });
              },
              onLongPress: () {
                model t1 = Global.g1.dataList[index];
                student_name.text = t1.student_name!;
                student_grid.text = t1.student_grid!;
                student_standerd.text = t1.student_standard!;
                editDialog(context, index);
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.primaries[index],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${data.student_name}",
                        style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold,),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${data.student_grid}",
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        "${data.student_standard}",
                        style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold,),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )
            : GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: Global.g1.dataList.length,
          itemBuilder: (context, index) {
            model data = Global.g1.dataList[index];
            return InkWell(
              onDoubleTap: () {
                setState(() {
                  Global.g1.dataList.removeAt(index);
                }
                );
              },
              onLongPress: () {
                model t1 = Global.g1.dataList[index];
                student_name.text = t1.student_name!;
                student_grid.text = t1.student_grid!;
                student_standerd.text = t1.student_standard!;
                editDialog(context, index);
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.primaries[index],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${data.student_name}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${data.student_grid}",
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        "${data.student_standard}",
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "detail").then(
                  (value) {
                setState(() {});
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Future<dynamic> editDialog(BuildContext context, int index) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: student_name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Title"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: student_grid,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Description"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: student_standerd,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Description"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(
                      () {
                     Global.g1.dataList[index] = model(
                      student_name: student_name.text,
                      student_grid: student_grid.text,
                      student_standard: student_standerd.text,
                    );
                  },
                );
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
