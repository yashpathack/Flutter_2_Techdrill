```dart
import 'dart:convert';


void main() {
  
  
  var rawJson = '{"url" : "https://example.com", "id" : 2}';
  
  var parsedJson = json.decode(rawJson);
  
  print(parsedJson['url']);
  print(parsedJson['id']);
  
  var  myModel = new PostModel(parsedJson['url'], parsedJson['id']);
//   var  myModel = new PostModel(parsedJson);
  
  
  print(myModel.id);
  print(myModel.url);
  
  
  

}

 class PostModel {
    
    String url;
    int id;
   
   PostModel(this.url, this.id);
   
   PostModel.fromJson(Map <String, dynamic> parsedJson) {
     url = parsedJson['url'];
     id = parsedJson['id'];
   }
    
    
  }
  ```