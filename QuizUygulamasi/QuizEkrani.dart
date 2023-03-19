import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:quiz_uygulamasi/QuizUygulamasi/Bayraklar.dart';
import 'package:quiz_uygulamasi/QuizUygulamasi/Bayraklardao.dart';
import 'package:quiz_uygulamasi/QuizUygulamasi/SonucEkrani.dart';

class QuizEkrani extends StatefulWidget {
  const QuizEkrani({Key? key}) : super(key: key);

  @override
  State<QuizEkrani> createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<QuizEkrani> {

  var sorular = <Bayraklar>[];
  var YanlisSecenekler = <Bayraklar>[];
  late Bayraklar dogruSoru;
  var tumSecenekler = HashSet<Bayraklar>();

  int SoruSayac=0;
  int dogruSayac=0;
  int yanlisSayac=0;

  String BayrakResimAdi = "placeholder.png";

  String ButtonAyazi = "";
  String ButtonByazi = "";
  String ButtonCyazi = "";
  String ButtonDyazi = "";

  Future<void> sorulariAl() async{
    sorular = await Bayraklardao().rastgele5Getir() as List<Bayraklar>;
    soruYukle();
  }

  Future<void> soruYukle() async{
    dogruSoru=sorular[SoruSayac];

    BayrakResimAdi = dogruSoru.bayrak_resim;
    
    YanlisSecenekler = await Bayraklardao().rastgele3YanlisGetir(dogruSoru.bayrak_id) as List<Bayraklar>;

    tumSecenekler.clear();
    tumSecenekler.add(dogruSoru);
    tumSecenekler.add(YanlisSecenekler[0]);
    tumSecenekler.add(YanlisSecenekler[1]);
    tumSecenekler.add(YanlisSecenekler[2]);

    ButtonAyazi = tumSecenekler.elementAt(0).bayrak_ad;
    ButtonByazi = tumSecenekler.elementAt(1).bayrak_ad;
    ButtonCyazi = tumSecenekler.elementAt(2).bayrak_ad;
    ButtonDyazi = tumSecenekler.elementAt(3).bayrak_ad;

    setState(() {
    });

  }

  void soruSayacKontrol(){
    SoruSayac=SoruSayac+1;

    if(SoruSayac!=5){
      soruYukle();
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SonucEkrani(dogruSayisi: dogruSayac,)));
    }
  }

  void dogruKontrol(String buttonYazi){

    if(dogruSoru.bayrak_ad==buttonYazi){
      dogruSayac=dogruSayac+1;
    }else{
      yanlisSayac=yanlisSayac+1;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sorulariAl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Doğru: ${dogruSayac}",style: TextStyle(fontSize: 18),),
                Text("Yanlış: ${yanlisSayac}",style: TextStyle(fontSize: 18),),
              ],
            ),
            SoruSayac!=5 ? Text("${SoruSayac+1}.SORU",style: TextStyle(fontSize: 30),) :
            Text("5.SORU",style: TextStyle(fontSize: 30),),
            Image.asset("resimler/$BayrakResimAdi"),
            SizedBox(width: 250, height: 50,
              child: TextButton(
                onPressed: (){
                dogruKontrol(ButtonAyazi);
                soruSayacKontrol();
                },
                child: Text("${ButtonAyazi}",style: TextStyle(color: Colors.black,fontSize: 20),),
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amber),
                ),
              ),
            ),
            SizedBox(width: 250, height: 50,
              child: TextButton(
                onPressed: (){
                  dogruKontrol(ButtonByazi);
                  soruSayacKontrol();
                },
                child: Text("${ButtonByazi}",style: TextStyle(color: Colors.black,fontSize: 20),),
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amber),
                ),
              ),
            ),
            SizedBox(width: 250, height: 50,
              child: TextButton(
                onPressed: (){
                  dogruKontrol(ButtonCyazi);
                  soruSayacKontrol();
                },
                child: Text("${ButtonCyazi}",style: TextStyle(color: Colors.black,fontSize: 20),),
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amber),
                ),
              ),
            ),
            SizedBox(width: 250, height: 50,
              child: TextButton(
                onPressed: (){
                  dogruKontrol(ButtonDyazi);
                  soruSayacKontrol();
                },
                child: Text("${ButtonDyazi}",style: TextStyle(color: Colors.black,fontSize: 20),),
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
