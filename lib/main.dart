// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutable, prefer_const_literals_to_create_immutables, camel_case_types
import 'package:flutter/material.dart';

import 'card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: project1(),
    );
  }
}

class project1 extends StatefulWidget {
  const project1({super.key});

  @override
  State<project1> createState() => _project1State();
}

class Qautes {
  String auther;
  String tittle;
  Qautes({required this.auther, required this.tittle});
}

//

class _project1State extends State<project1> {
  List allQautes = [
    Qautes(auther: "ahmed", tittle: "life is a large lesson "),
    Qautes(auther: "ahmed", tittle: "progress slowly still progress "),
    Qautes(auther: "ahmed", tittle: "despline is the basic of sucess "),
    Qautes(auther: "ahmed", tittle: "passion is not everything  ")
  ];
  delete(Qautes item) {
    setState(() {
      allQautes.remove(item);
    });
  }

  addnewQauts() {
    setState(() {
      allQautes.add(
        Qautes(auther: myController2.text, tittle: myController.text),
      );
    });
  }

  //create controller to get the text inside textfield in the dialog widget
  final myController = TextEditingController();
  final myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 141, 90, 90),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: myController,
                        decoration:
                            InputDecoration(hintText: ("add new Qauts")),
                        maxLength: 50,
                      ),
                      TextField(
                        controller: myController2,
                        decoration: InputDecoration(hintText: ("author")),
                        maxLength: 50,
                      ),
                      TextButton(
                          onPressed: () {
                            addnewQauts();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "ADD",
                            style: TextStyle(fontSize: 30),
                          ))
                    ],
                  ),
                );
              },
              isScrollControlled: true,
            );
          },
          child: Icon(
            Icons.add,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        appBar: AppBar(
          elevation: 5,
          backgroundColor: Color.fromARGB(255, 150, 97, 97),
          title: Text(
            "Qautes awesome",
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 17, 17, 14)),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ...allQautes
                  .map((item) => cardWidget(
                        mytittle: item.tittle,
                        person: item.auther,
                        delete: delete,
                        item: item,
                      ))
                  .toList()
            ],
          ),
        ));
  }
}
