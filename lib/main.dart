import 'dart:convert';
import 'package:flutter/material.dart';

void main() => runApp(new MyHome());

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      title: "Json App",
      home: Myapp(),
    );
  }
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local json App"),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('local_json/local.json'),
            builder: (context, snapshot) {
              var mydata = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "Name: " + mydata[index]['name'],
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Age: " + mydata[index]['age'],
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Height: " + mydata[index]['height'],
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Color: " + mydata[index]['color'],
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: mydata == null ? 0 : mydata.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
