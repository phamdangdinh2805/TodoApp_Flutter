import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ModelButton extends StatelessWidget {
  ModelButton({super.key, required this.addTask});
  final Function addTask;
  TextEditingController controller = TextEditingController();
  void _handleOnClick(BuildContext context) {
    final name = controller.text;
    if (name.isEmpty) {
      return;
    }
    addTask(name);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: 200,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Nhập công việc"),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => _handleOnClick(context),
                  child: const Text("Thêm công việc"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
