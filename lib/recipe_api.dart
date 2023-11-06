import 'dart:convert';
import 'dart:developer';
import 'package:api_get_project/post.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


  //const options = {
  //   method: 'GET',
  //   url: 'https://yummly2.p.rapidapi.com/feeds/list',
  //   params: {
  //     limit: '24',
  //     start: '0'
  //   },
  //   headers: {
  //     'X-RapidAPI-Key': 'fb0cd66080msh19a3fd4e95cc88cp1eadefjsnf6d2085e4640',
  //     'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
  //   }
  // };

  List<Recipe> parseUser(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Recipe> resipes =
    list.map((model) => Recipe.fromJson(model)).toList();
    return resipes;
  }

  Future<List<Recipe>> getRecipes() async {
    var url = Uri.parse(
        "https://yummly2.p.rapidapi.com/feeds/list",0,23);
    final response = await http.get(url,headers: {
      'X-RapidAPI-Key': 'fb0cd66080msh19a3fd4e95cc88cp1eadefjsnf6d2085e4640',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
    });
    if (response.statusCode == 200) {
      log(response.body);
      return compute(parseUser,response.body);
    } else {
      throw Exception("Can't get produts --------------- ");
    }
  }
