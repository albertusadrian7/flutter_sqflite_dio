import 'package:flutter/material.dart';
import 'package:flutter_dio_sqflite/db_helper.dart';

import 'contact.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key, this.contact});

  final Contact? contact;

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    if(widget.contact != null) {
      nameController.text = widget.contact!.name;
      emailController.text = widget.contact!.email;
    }
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Contact'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(false),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
