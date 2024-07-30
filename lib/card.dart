// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';


import 'main.dart';

class cardWidget extends StatelessWidget {
  String mytittle;
  String person;
  Function delete;
  Qautes item;

  cardWidget({
    super.key,
    required this.mytittle,
    required this.person,
    required this.delete,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 184, 160, 89),
      margin: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: EdgeInsets.all(11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              mytittle,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  person,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                IconButton(
                  onPressed: () {
                    delete(item);
                  },
                  icon: const Icon(Icons.delete),
                  color: Colors.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
