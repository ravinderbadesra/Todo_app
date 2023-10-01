import 'package:flutter/material.dart';
import 'package:todoapp_crud/contants/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: tdBGcolor,
        appBar: AppBar(
          backgroundColor: tdBGcolor,
          elevation: 0,
          foregroundColor: tdBlack,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                )),
            CircleAvatar(backgroundImage: AssetImage("lib/images/OIP (2).jpg")),
          ]),
        ),
        body: Column(
          children: [Text("data")],
        ),
      ),
    );
  }
}
