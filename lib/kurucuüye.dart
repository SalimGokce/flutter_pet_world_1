import 'package:flutter/material.dart';
import 'package:flutter_pet_world_1/yard%C4%B1mc%C4%B1lar/kurucukart.dart';

class KurucUye extends StatefulWidget {
  @override
  _KurucUyeState createState() => _KurucUyeState();
}

class _KurucUyeState extends State<KurucUye> {
  List<String> kurucu = [
    "Salim Gökçe",
    "Pamukkale Üniversitesi Bilgisayar Mühendisliği öğrencisi",
    "23 Yaşında",
    "Hayvansever",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kurucu Üye")),
      body: Padding(
        padding: EdgeInsets.all(33.0),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: kurucu.length,
          itemBuilder: (BuildContext context, int pozisyon) {
            return KurucuKart(kurucu: kurucu[pozisyon],);
          },
        ),
      ),
    );
  }
}
