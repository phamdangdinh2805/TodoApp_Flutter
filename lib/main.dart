import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_app/modal/items.dart';
import 'package:todo_app/pages/success_tasks_page.dart';
import 'package:todo_app/widget/card_body_widget.dart';
import 'package:todo_app/widget/card_modal_button.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<DataItems> items = <DataItems>[];

  void _handleAddTask(String name) {
    final newItem = DataItems(id: DateTime.now().toString(), name: name);
    setState(() {
      items.add(newItem);
    });
  }

  void _handleDeleteTask(String id) {
    setState(() {
      items.removeWhere((item) => item.id == id);
    });
  }

  void _handleSuccessTasks() {
    Navigator.push(
        context,
        // MaterialPageRoute(builder: (context) => const SuccessTasksPage()),
        PageTransition(
            type: PageTransitionType.rightToLeft,
            child: const SuccessTasksPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 70,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("TodoList", style: TextStyle(fontSize: 40)),
              IconButton(
                icon: const Icon(
                  Icons.arrow_circle_right,
                  size: 40,
                ),
                onPressed: _handleSuccessTasks,
              )
            ],
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          children: items
              .map((item) => CardBody(
                    index: items.indexOf(item),
                    item: item,
                    handleDeleteItem: _handleDeleteTask,
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return ModelButton(addTask: _handleAddTask);
              });
        },
        child: const Icon(Icons.add, size: 40),
      ),
    );
  }
}
