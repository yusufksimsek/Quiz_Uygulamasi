import 'package:flutter/material.dart';
import 'package:quiz_uygulamasi/QuizUygulamasi/main01.dart';

class SonucEkrani extends StatefulWidget {
  late int dogruSayisi;

  SonucEkrani({required this.dogruSayisi});

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            Text("${widget.dogruSayisi} DOĞRU ${5-widget.dogruSayisi} YANLIŞ",style: TextStyle(fontSize: 35,color: Colors.black),),
            Text("%${((widget.dogruSayisi*100)/5).toInt()} Başarı",style: TextStyle(fontSize: 35,color: Colors.pink),),

            SizedBox(width: 250, height: 50,
              child: TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("TEKRAR DENE",style: TextStyle(color: Colors.black,fontSize: 20),),
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
