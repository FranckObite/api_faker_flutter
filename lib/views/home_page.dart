import 'package:flutter/material.dart';

import 'dart:math';

import '../controllers/user_factory.dart';
import '../models/user/user.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  int length = 0;
  List<Color> color = [
    Color.fromRGBO(
        Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1),
    Color.fromRGBO(
        Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1),
    Color.fromRGBO(
        Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1),
    Color.fromRGBO(
        Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1),
    Color.fromRGBO(
        Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1),
    Color.fromRGBO(
        Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1),
    Color.fromRGBO(
        Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1),
    Color.fromRGBO(
        Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1),
  ];

  @override
  Widget build(BuildContext context) {
    //final User user = UserFactory().generateFake();
    List<User> user1 = UserFactory().generateFakeList(length: length);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Faker App"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: (length != 0)
                ? ListView.builder(
                    itemCount: user1.length,
                    itemBuilder: (context, int index) {
                      return Card(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 4,
                          color: color[Random().nextInt(color.length)],
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor:
                                      color[Random().nextInt(color.length)],
                                  child: Icon(
                                    Icons.account_circle,
                                    size: 30,
                                    color:
                                        color[Random().nextInt(color.length)],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                user1[index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.email),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(user1[index].email)
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    })
                : const Text("Pas de Donner Ajoutées")),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          child: const Icon(Icons.add),
          onPressed: () {
            mondialog();
          }),
    );
  }

  Future<void> mondialog() async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Add length"),
            content: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Annuler")),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                      onPressed: () async {
                        if (int.tryParse(controller.text)! > 6) {
                          await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const AlertDialog(
                                  content: Text(
                                      "Veuillez entrer svp un entier plus petit que 6. Merci!"),
                                );
                              });
                          controller.text = "";
                        } else {
                          setState(() {
                            length = int.tryParse(controller.text)!;
                            controller.text = "";
                          });
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text("Generer"))
                ],
              )
            ],
          );
        });
  }
}
