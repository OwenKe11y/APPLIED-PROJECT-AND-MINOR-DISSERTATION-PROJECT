// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:even_ticket/data/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../data/event.dart';
import '../layout.dart';

// Create User
Future<String> loginUser(String email, String password) async {
  final response = await http.post(
    Uri.parse('http://192.168.1.11:3000/api/users/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials":
          "true", // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    },
    body: jsonEncode(<String, String>{'email': email, 'password': password}),
  );

  if (response.statusCode == 200 && response.body == 'PASS') {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return "PASS";
  } else if (response.body == 'FAIL') {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    return 'FAIL';
  } else {
    throw Exception('Failed to login');
  }
}

// Create User
Future<User> createUser(String name, String email, String password) async {
  final response = await http.post(
    Uri.parse('http://192.168.1.11:3000/api/users'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials":
          "true", // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    },
    body: jsonEncode(
        <String, String>{'name': name, 'email': email, 'password': password}),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    log(User.fromJson(jsonDecode(response.body)).toString());
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create User.');
  }
}

// Get all events and send back each event
Future<void> getEvents() async {
  final response = await http.get(
      Uri.parse('http://192.168.1.11:3000/api/events'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        "Access-Control-Allow-Credentials":
            "true", // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Headers":
            "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "GET, OPTIONS"
      });

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    final parsedJson = jsonDecode(response.body);

    // Create event out of each object
    for (var event in parsedJson) {
      // Convert displayImage from blob to Image
      Uint8List imageBytes = base64Decode(event['displayImage']);

      // Convert blob to image and add to the list
      List<dynamic> galleryImages = List.empty(growable: true);
      for (var blob in event['galleryImages']) {
        Uint8List bytes = base64Decode(blob);
        galleryImages.add(bytes);
      }

      // Create Event from json
      var tempEvent = Event(
          displayImage: imageBytes,
          title: event['title'],
          description: event['description'],
          location: event['location'],
          duration: event['duration'],
          punchLine1: event['punchline1'],
          punchline2: event['punchline2'],
          catagoryIds: event['categoryIds'],
          galleryImages: galleryImages);

      // Add to events
      events.add(tempEvent);
    }
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to get events');
  }
}

// Get all events and send back each event
Future<String> getTicketsFaces() async {
  final response = await http.get(
      Uri.parse('http://localhost:3000/api/tickets/faces'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        "Access-Control-Allow-Credentials":
            "true", // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Headers":
            "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "GET, OPTIONS"
      });

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return response.body;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to get events');
  }
}
