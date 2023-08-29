import 'package:flutter/material.dart';
import 'package:flutter_dio_sqflite/contact_card.dart';
import 'package:flutter_dio_sqflite/db_helper.dart';
import 'package:flutter_dio_sqflite/db_helper_dio.dart';

import 'contact.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Contact? contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SQLite Dio Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              contact != null
                  ? ContactCard(contact: contact!)
                  : const Text('No data!'),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    onPressed: () async {
                      Contact? result = await DbHelperDio.getById(2);
                      if (result != null) {
                        setState(() {
                          contact = result;
                        });
                      }
                    },
                    child: const Text('GET')),
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    onPressed: () async {
                      // Person? result = await Services.createUser(
                      //     "Albertus", "Adrian", "albertus@gmail.com");
                      // if(result!=null) {
                      //   setState(() {
                      //     person = result;
                      //   });
                      // }
                    },
                    child: const Text('SAVE TO LOCAL')),
              )
            ],
          ),
        ));
  }

  // Insert a new journal to the database
  Future<void> addItem(Contact contact) async {
    await DbHelperSqflite.insertItem(
        contact.name,contact.email
    );
    refreshJournals();
  }
}
