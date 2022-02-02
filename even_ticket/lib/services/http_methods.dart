// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:developer';

import 'package:even_ticket/data/user.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../layout.dart';

Future<User> createUser(String name, String email, String password, String password2) async {
  final response = await http.post(
    Uri.parse('http://localhost:3000/register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'email': email,
      'password': password,
      'password2': password2,
    }),
  );
  
  
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    Get.offAll(SiteLayout());
    log(User.fromJson(jsonDecode(response.body)).toString());
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

