
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;






class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> users = [] ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fetch Api",
      home: Scaffold(
        floatingActionButton:  FloatingActionButton(
              onPressed: fetchusers,
              child: const Icon(Icons.add),
            ),
        appBar: AppBar(
          title: Center(child: const Text("Fetch Api")),
        ),
        body: users.isEmpty  ? Center(child: Text("No Data" , style: TextStyle(
          fontSize: 30
        ),)) :  Container(
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
            final name = users[index]['name'] ;
            final email = users[index]['email'] ;
            final id = users[index]['id'] ;
            final address = users[index]['address']['city'] ;
            return SingleChildScrollView(
              child: (          
                ListTile(
                  leading: CircleAvatar(backgroundColor: Colors.green,
                  child: Text('$id'),
                  ),
                  title: Text("$name"),
                  subtitle: Text('$email'),
                  trailing: Text('$address'),
                )
              ),
            );
          }),
        )
        
      ),
    );
  }


  







void fetchusers() async{
const url = 'https://jsonplaceholder.typicode.com/users' ;
final uri = Uri.parse(url);
final response = await  http.get(uri);
final body = response.body ;
final json = jsonDecode(body) ;

setState((){
     users = json;
});
 
 print(users);




}





}