import 'package:drillapp/main.dart';
import 'package:drillapp/src/models/model_post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// https://jsonplaceholder.typicode.com/posts/1

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future <PostModel> futurePostModel;

  @override
    void initState() {
     
      super.initState();
      futurePostModel = fetchData();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("My Title"),
      ),

      body: Center(
        
        
        
        child: FutureBuilder <PostModel>(
          
          future: futurePostModel,
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return Text(snapshot.data.userId.toString());
            } else if (snapshot.hasError){
              return Text("Error occured: ${snapshot.error}");
            }

            return CircularProgressIndicator();
          },
          
          
          ),
        
        ),

     
      
    );
  }
}