import 'package:flutter/material.dart';
import 'package:todoapp_crud/contants/color.dart';
import 'package:todoapp_crud/models/todoclass.dart';
import 'package:todoapp_crud/screens/buildappbar.dart';
import 'package:todoapp_crud/screens/todolist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final todoLists = ToDo.todoLists();
final searchController = TextEditingController();

class _HomePageState extends State<HomePage> {
  List<ToDo> foundTodo = [];
  @override
  void initState() {
    foundTodo = todoLists;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: tdBGcolor,
        appBar: AppBarWidget.buildAppbar(),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: Colors.white),
                      child: TextFormField(
                          onChanged: (value) => searchTodoItems(value),
                          decoration: InputDecoration(
                              hintText: "search",
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.blue,
                              ),
                              border: InputBorder.none)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "All ToDos",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    for (var todoItems in foundTodo)
                      ToDoList(
                        toDo: todoItems,
                        todoChange: handleTodoChange,
                        todoDelete: deleteTodoItem,
                      ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 4,
                                color: Colors.grey),
                          ]),
                      child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Add todo item")),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    // padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blue,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 35,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        addTodoItem(searchController.text.toString());
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  //todo change function
  void handleTodoChange(ToDo todochange) {
    setState(() {
      todochange.isDone = !todochange.isDone;
    });
  }

// when a todo delete function
  void deleteTodoItem(String id) {
    setState(() {
      todoLists.removeWhere((element) => element.id == id);
    });
  }

  //function on add todo items
  void addTodoItem(String id) {
    setState(() {
      todoLists
          .add(ToDo(id: DateTime.now().microsecond.toString(), todorText: id));
    });
    searchController.clear();
  }

  //search item fuction create
  void searchTodoItems(String enterKey) {
    List<ToDo> results = [];
    if (enterKey.isEmpty ) {
      results == todoLists;
    } else {
      results = todoLists
          .where((item) =>
              item.todorText!.toLowerCase().contains(enterKey.toLowerCase()))
          .toList();
    }
    setState(() {
      foundTodo = results;
    });
  }
}
