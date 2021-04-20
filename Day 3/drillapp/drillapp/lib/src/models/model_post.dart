import 'package:flutter/foundation.dart';




class PostModel {
  int userId;
  int id;
  String title;
  String body;



  PostModel(@required this.userId, @required this.id, @required this.title, @required this.body);

   PostModel.fromJson(Map <String, dynamic> parsedJson) {
     userId = parsedJson['userId'];
     id = parsedJson['id'];
     title = parsedJson['title'];
     body = parsedJson['body'];
   }
 
}