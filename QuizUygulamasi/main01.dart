// @dart=2.9

import 'package:flutter/material.dart';
import 'package:quiz_uygulamasi/QuizUygulamasi/QuizEkrani.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home:  Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {


  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            
            Text("QUİZE HOŞGELDİNİZ",style: TextStyle(fontSize: 35,color: Colors.black),),
            SizedBox(width: 250, height: 50,
              child: TextButton(
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> QuizEkrani()));
              },
                  child: Text("BAŞLA",style: TextStyle(color: Colors.black,fontSize: 20),),
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amber),
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}
