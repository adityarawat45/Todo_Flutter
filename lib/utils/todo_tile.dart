import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  TodoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
           onPressed: deleteFunction,
            icon: Icons.delete_outline_rounded,
            backgroundColor: Vx.red600,
            borderRadius:  BorderRadius.circular(12),
            // padding: EdgeInsets.only(left: 10,
            spacing: 10,
          )
        ]),
        child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(147, 216, 180, 254),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Vx.gray800,
                ),
                Text(
                  taskName,
                  style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600, // semiBold
                    fontFamily:
                        'Poppins', // Assuming you've imported the Poppins font
                  ),
                ).p24(),
              ],
            ))).pOnly(left: 25, right: 25, top: 25);
  }
}
