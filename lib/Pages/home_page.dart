
import 'package:flutter/material.dart';

class Homepage extends  StatelessWidget{
  final int days = 30;
 final String name = "gaurav";
  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text("catalog app"),
      ),
        body: Center(
          child: Container(
            child: Text("welcome to $days days of flutter by $name"),
          ),
        ),
        drawer: Drawer(),
      );
  }
}