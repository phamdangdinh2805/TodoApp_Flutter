import 'package:flutter/material.dart';

class SuccessTasksPage extends StatelessWidget {
  const SuccessTasksPage({super.key});

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks đã hoàn thành'),
      ),
      body: const Center(
        child: Text('Success'),
      ),
    );
  }
}
