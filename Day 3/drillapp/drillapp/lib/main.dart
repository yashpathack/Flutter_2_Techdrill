import 'package:drillapp/src/models/model_post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'src/home_page.dart';
import 'dart:async';
import 'dart:convert';

// https://jsonplaceholder.typicode.com/posts/1

Future <PostModel> fetchData () async {

  final url = Uri.https('jsonplaceholder.typicode.com', 'posts/1');
  final response =  await http.get(url);

  if(response.statusCode == 200) {
    return PostModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to get');
  }

}




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}


