
import 'dart:convert';
import 'dart:developer';
import 'package:api_get_project/post.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<User> getUser() async {
  final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    return User.fromJson(json.decode(response.body));
  } else {
    throw Exception("Failed to load post");
  }
}

Future<User> createUser(String title,String body) async {
  Map<String, dynamic> request = {
    "title" : title,
    "body" : body,
    "userId" : "111"
  };
  final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  final response = await http.post(uri, body: request);
  if(response.statusCode == 201 ) {
    return User.fromJson(json.decode(response.body));
  } else {
    throw Exception("Failed to load post");
  }
}

Future<User> updateUser(String title, String body) async {
  Map<String, dynamic> request = {
    "id" : "101",
    "title" : title,
  "body" : body,
  "userId" : "111"
  };
  final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
  final response = await http.put(uri,body: request);
  if (response.statusCode == 200) {
    return User.fromJson(json.decode(response.body));
  } else {
    throw Exception("Failed to load post");
  }
}

Future<User?>? deleteUser() async {
  final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
  final response = await http.delete(uri);

  if(response.statusCode == 200) {
    return null;
  } else {
    throw Exception("Failed to load post");
  }
}


List<User> parseUser(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  List<User> users =
  list.map((model) => User.fromJson(model)).toList();
  return users;
}

Future<List<User>> getUsers() async {
  var url = Uri.parse(
      "https://jsonplaceholder.typicode.com/posts");
  final response = await http.get(url);
  if (response.statusCode == 200) {
    log(response.body);
    return compute(parseUser,response.body);
  } else {
    throw Exception("Can't get produts --------------- ");
  }
}













