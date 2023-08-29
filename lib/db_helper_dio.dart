import 'package:dio/dio.dart';
import 'package:flutter_dio_sqflite/contact.dart';

abstract class DbHelperDio {
  static Future<Contact?> getById(int id) async {
    try {
      var response = await Dio().get("https://reqres.in/api/users/$id");
      if (response.statusCode == 200) {
        return Contact(
            id: response.data["data"]["id"],
            name: response.data["data"]["first_name"] +
                " " +
                response.data["data"]["last_name"],
            email: response.data["data"]["email"]);
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<Contact?> createUser(
      String firstName, String lastName, String email) async {
    try {
      var response = await Dio().post("https://reqres.in/api/users", data: {
        "first_name" : firstName,
        "last_name" : lastName,
        "email" : email
      });

      if(response.statusCode == 201) {
        return Contact(
            id: int.tryParse(response.data["id"].toString()) ?? 0,
            name: response.data["first_name"]+' '+response.data["last_name"],
            email: response.data["email"]
        );
      }
    } catch (e) {
      throw Exception(e.toString());
    }

  }
}
