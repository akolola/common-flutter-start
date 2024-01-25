import 'package:flutter/material.dart'; 
import 'package:http/http.dart' as http; 
import 'dart:convert'; 
  
void main() => runApp(MyHomePage()); 
 
  
class MyHomePage  extends StatefulWidget {
 
  @override 
  _MyHomePageState  createState() => _MyHomePageState(); 

} 
  
class _MyHomePageState extends State<MyHomePage> { 

  final myController = TextEditingController();

  void writeData() async {     
    var url = "https://common-firebase-default-rtdb.firebaseio.com/"+"data.json";      
    try { 
      final response = await http.post( 
        Uri.parse(url), 
        body: json.encode({"title": myController.text}), 
      ); 
    } catch (error) { 
      throw error; 
    } 
  } 
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Common. Database Input',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Common. Database Input'),
          backgroundColor: Colors.grey,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter a string value',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: writeData,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
