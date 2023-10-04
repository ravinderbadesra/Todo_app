
  import 'package:flutter/material.dart';
import 'package:todoapp_crud/contants/color.dart';

class AppBarWidget{

static AppBar buildAppbar() {
    return AppBar(
      backgroundColor: tdBGcolor,
      elevation: 0,
      foregroundColor: tdBlack,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
            )),
        CircleAvatar(backgroundImage: AssetImage("lib/images/OIP (2).jpg")),
      ]),
    );
  }
}

