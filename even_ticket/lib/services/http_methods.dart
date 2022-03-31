// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:even_ticket/data/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../data/event.dart';
import '../layout.dart';

// Login User
Future<String> loginUser(String email, String password) async {
  final response = await http.post(
    Uri.parse('http://eventicketapi.herokuapp.com/api/users/login'),
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

Future<String> getUser(String email) async {
  final response = await http.post(
    Uri.parse('https://eventicketapi.herokuapp.com/api/users/retrieve'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials":
          "true", // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    },
    body: jsonEncode(<String, String>{'email': email}),
  );

  if (response.statusCode == 200) {
    final parsedUser = jsonDecode(response.body);
    // Create Event from json
    var tempUser = User(
        email: parsedUser[0]['email'],
        password: parsedUser[0]['password'],
        name: parsedUser[0]['name'],
        favourites: parsedUser[0]['favourites'],
        isOrganiser: parsedUser[0]['isOrganiser'],
        face: parsedUser[0]['face']);

    currentUser = tempUser;
    return "OK";
  } else {
    return "FAIL";
  }
}

// Create User
Future<String> createUser(String name, String email, String password,
    bool isOrganiser, String face) async {
  face = face.toString();

  final response = await http.post(
    Uri.parse('http://eventicketapi.herokuapp.com/api/users'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials":
          "true", // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    },
    body: jsonEncode({
      'name': name,
      'email': email,
      'password': password,
      'favourites': [" ", " "],
      'isOrganiser': isOrganiser,
      'face': face
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return 'OK';
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create User.');
  }
}

Future<void> createEvent(
    String title,
    String description,
    String price,
    String location,
    String time,
    String punchline1,
    String punchline2,
    DateTime date,
    File displayImage,
    List categoryIds,
    List<File> galleryImages) async {
  // Convert displayImage from File to base64
  String displayImageBase64 = base64Encode(await displayImage.readAsBytes());

  // Convert galleryImages from Files to base64
  List<String> galleryImagesBase64 = [];
  for (var image in galleryImages) {
    galleryImagesBase64.add(base64Encode(await image.readAsBytes()));
  }

  // Add all category to categoryIDs
  categoryIds.add(0);

  // Post Event to server
  final response = await http.post(
    Uri.parse('http://eventicketapi.herokuapp.com/api/events'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials":
          "true", // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    },
    body: jsonEncode({
      'title': title,
      'description': description,
      'price': price,
      'location': location,
      'time': time,
      'punchline1': punchline1,
      'punchline2': punchline2,
      'date': date.toString(),
      'displayImage': displayImageBase64,
      'categoryIds': categoryIds,
      'galleryImages': galleryImagesBase64
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return print("Event created");
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create Event.' + response.body);
  }
}

// Get all events and send back each event
Future<void> getEvents() async {
  final response = await http.get(
      Uri.parse('http://eventicketapi.herokuapp.com/api/events'),
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
      List<dynamic> galleryImages = [];
      for (var blob in event['galleryImages']) {
        for (var i = 0; i < 3; i++) {
          Uint8List bytes = base64Decode(blob[i]);
          galleryImages.add(bytes);
        }
      }

      // Format event time
      event['time'] = event['time'].toString().split("(")[1].split(")")[0];
      event['date'] = event['date'].toString().split(" ")[0];
      // Create Event from json
      var tempEvent = Events(
          title: event['title'],
          description: event['description'],
          price: event['price'],
          location: event['location'],
          time: event['time'],
          punchLine1: event['punchline1'],
          punchline2: event['punchline2'],
          date: DateTime.parse(event['date']),
          displayImage: imageBytes,
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
      Uri.parse('http://eventicketapi.herokuapp.com/api/tickets/faces'),
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

// If you are using a real device to test the integration replace this url
// with the endpoint of your test server (it usually should be the IP of your computer)
final kApiUrl = defaultTargetPlatform == TargetPlatform.android
    ? 'http://192.168.1.11:3000'
    : 'http://localhost:4242';
