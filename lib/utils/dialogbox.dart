import 'package:flutter/material.dart';
import 'package:todo_app/utils/button.dart';
import 'package:velocity_x/velocity_x.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSaved;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Vx.purple300,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Container(
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Add a new task'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(text: "Add", bColor: Vx.green600, onPressed: onSaved)
                    .pOnly(top: 15),
                Button(text: "Cancel", bColor: Vx.red500, onPressed: onCancel)
                    .pOnly(top: 15)
              ],
            )
          ],
        ).p4(),
      ),
    );
  }
}
