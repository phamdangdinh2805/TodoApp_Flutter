import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditTasksPage extends StatefulWidget {
  EditTasksPage({super.key, required this.item});
  var item;
  setTaskName(String newName) {}
  @override
  State<EditTasksPage> createState() => _EditTasksPageState();
}

class _EditTasksPageState extends State<EditTasksPage> {
  final TextEditingController EditControllerTask = TextEditingController();
  void _handleEditTask(BuildContext context) {
    final editTask = EditControllerTask.text;
    if (editTask.isEmpty) {
      return;
    }
    widget.item.setName(editTask);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Tasks'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Đánh dấu là đã hoàn thành",
                    style: TextStyle(fontSize: 20),
                  ),
                  Checkbox(
                      value: widget.item.status,
                      onChanged: (bool? value) => {
                            setState(() {
                              widget.item.status = value!;
                              print(widget.item.status);
                            })
                          }),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: TextField(
                  controller: EditControllerTask,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Sửa Task',
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ))),
                  child: const Text("Lưu"),
                  onPressed: () => _handleEditTask(context),
                ),
              )
            ],
          ),
        ));
  }
}
