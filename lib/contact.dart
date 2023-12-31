import 'dart:convert';

class Contact {
  int? id;
  String name;
  String email;

  Contact({this.id, required this.name, required this.email});

  factory Contact.fromJson(Map<String, dynamic> json) =>
      Contact(id: json['id'], name: json['name'], email: json['email']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
      };
}

List<Contact> contactFromJson(String str) =>
    List<Contact>.from(json.decode(str).map((x) => Contact.fromJson(x)));

String contactToJson(List<Contact> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

