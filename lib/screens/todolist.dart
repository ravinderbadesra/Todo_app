import 'package:flutter/material.dart';
import 'package:todoapp_crud/contants/color.dart';
import 'package:todoapp_crud/models/todoclass.dart';

class ToDoList extends StatelessWidget {
  final ToDo toDo;
  final todoChange;
  final todoDelete;

  const ToDoList(
      {super.key,
      required this.toDo,
      required this.todoChange,
      required this.todoDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        onTap: () {
          todoChange(toDo);
          
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        tileColor: Colors.white,
        leading: IconButton(
          icon: toDo.isDone?Icon(Icons.check_box,color: Colors.blue,):Icon(Icons.check_box_outline_blank,) ,
          onPressed: () {},
        ),
        title: Text(
          toDo.todorText.toString(),
          style: TextStyle(
              fontWeight: FontWeight.w600,
              decoration: toDo.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: tdRed, borderRadius: BorderRadius.circular(6)),
          child: IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.white,
              size: 22,
            ),
            onPressed: () {
              todoDelete(toDo.id);
             
            },
          ),
        ),
      ),
    );
  }
}
