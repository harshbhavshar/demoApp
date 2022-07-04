// ignore_for_file: avoid_print, file_names, non_constant_identifier_names, prefer_const_declarations, unnecessary_new, prefer_collection_literals, unused_local_variable

import 'dart:convert';

import 'package:app/pages/reuseble.dart';
import 'package:app/pages/screen_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'DeliveryAddressApi.dart';

var dio = Dio();

Apicall(context, String email, String password) async {
  final String pathUrl =
      'https://pacific-fjord-71880.herokuapp.com/users/login';
  dynamic data = {"email": email, "password": password};
  var response = await dio.post(pathUrl, data: data);

  if (response.statusCode == 200) {
    UserModel userModel = UserModel.fromJson(response.data);

    final String pathUrl =
        'https://pacific-fjord-71880.herokuapp.com/users/getDeliveryAddress';

    var response2 = await dio.get(pathUrl,
        options: Options(headers: {
          'x-auth-token':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyYzE2YWY3MWFiZjVjMDAxNjkwMDhmMyIsImlhdCI6MTY1NjkxMDEzNX0.6g0GsRoO4Bo2QrpcLRENDB1GXNa3bAulrqJUlPuLAWc'
        }));

    if (response2.statusCode == 200) {
      print(response2.data[0]);
      final encod = jsonEncode(response2.data[0]);
      print(encod);
      Address address = Address.fromJson(jsonDecode(encod));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Screen2(
                    name: address.name!,
                    number: address.mobileNumber!,
                    addresss: address.address!,
                    status: address.status!,
                    fname: address.fromName!,
                    faddresss: address.fromAddress!,
                  )));
    } else {
      print("Error");
    }
  } else {
    snak(context, "some error");
  }
}

class UserModel {
  String? token;
  User? user;

  UserModel({this.token, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? username;
  String? phoneNumber;
  int? iV;

  User(
      {this.sId,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.username,
      this.phoneNumber,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    username = json['username'];
    phoneNumber = json['phone_number'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['username'] = username;
    data['phone_number'] = phoneNumber;
    data['__v'] = iV;
    return data;
  }
}
