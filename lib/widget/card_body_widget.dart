import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_app/pages/edit_tasks_page.dart';

// ignore: must_be_immutable
class CardBody extends StatelessWidget {
  CardBody({
    super.key,
    required this.index,
    required this.item,
    required this.handleDeleteItem,
  });
  var item;
  var index;
  final Function handleDeleteItem;
  void _handleEditTasks(BuildContext context, var item) {
    Navigator.push(
        context,
        // MaterialPageRoute(builder: (context) => const SuccessTasksPage()),
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: EditTasksPage(item: item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
          color: index % 2 == 0 ? Colors.orange : Colors.redAccent,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: [
                  Text(item.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  // ignore: prefer_interpolation_to_compose_strings
                  Text("Ngày lập : " + item.id),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  padding: const EdgeInsets.only(left: 25),
                  icon: const Icon(Icons.edit),
                  onPressed: () => _handleEditTasks(context, item),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    if (await confirm(context)) {
                      return handleDeleteItem(item.id);
                    }
                    return;
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
