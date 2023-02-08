import 'package:flutter/material.dart';
import 'package:halldenapp/models/global.dart';

class IntrayTodo extends StatelessWidget {
  const IntrayTodo({super.key, required this.title, required this.keyValue});
  final String title;
  final String keyValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(keyValue),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
      height: 100,
      decoration: BoxDecoration(
          color: redColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            const BoxShadow(
              color: Colors.black,
              blurRadius: 10.0,
            )
          ]),
      child: Row(children: [
        // ignore: prefer_const_constructors
        Radio(
          value: null,
          groupValue: null,
          onChanged: (Null? value) {},
        ),
        Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              title,
              style: darkTodoTitle,
            ),
          ],
        )
      ]),
    );
  }
}
