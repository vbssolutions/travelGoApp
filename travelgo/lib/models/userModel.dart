import 'package:flutter/material.dart';

class UserModel {
  String? userId;
  UserModel({this.userId});
}

class UserData {
  String? id;
  String? name;
  String? surname;
  String? matricule;
  String? phone;
  String? email;
  String? password;

  UserData({
    this.id,
    this.email,
    this.matricule,
    this.name,
    this.password,
    this.phone,
    this.surname,
  });
}
