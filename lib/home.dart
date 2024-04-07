import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utils/dialogbox.dart';
import 'package:todo_app/utils/todo_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final _mybox = Hive.box('mybox');
  DB db = DB();

  
  void initState() {
    if (_mybox.get("TODOLIST") == null) {
      db.createInitData();
    } else {
      db.loadData();
    }
    super.initState();
  }


  void deleteTask(int ind) {
    setState(() {
      db.todoList.remove(db.todoList[ind]);
    });
    db.updateData();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void saveNewtask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
    });
    db.updateData();
    Navigator.of(context).pop();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.purple200,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 189, 153, 224),
        title: "ToDo"
            .text
            .extraBold
            // .fontWeight(FontWeight.bold)
            .size(25)
            .color(Vx.black)
            .textStyle(GoogleFonts.montserrat())
            .make(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => DialogBox(
                    onCancel: () {
                      Navigator.of(context).pop();
                    },
                    onSaved: saveNewtask,
                    controller: _controller,
                  ));
        },
        backgroundColor: Vx.purple100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)),
        child: const Icon(
          CupertinoIcons.add,
          size: 32,
          color: Vx.purple900,
        ),
      ),
      body: db.todoList.isEmpty
          ? Center(
              child: "Add a task"
                  .text
                  .color(Vx.black)
                  .size(18)
                  .textStyle(GoogleFonts.poppins())
                  .semiBold
                  .makeCentered(),
            )
          : ListView.builder(
              itemCount: db.todoList.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  taskName: db.todoList[index][0],
                  taskCompleted: db.todoList[index][1],
                  onChanged: (value) => checkBoxChanged(value!, index),
                  deleteFunction: (context) => deleteTask(index),
                );
              },
            ),
    );
  }
}
