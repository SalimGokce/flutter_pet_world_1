import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Iletisim extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("İletişim"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/kopek6.jpg"),
                  fit: BoxFit.fill,
                  ),
                
              ),
            ),
            Container(
              height:100,
              child: Center(
                child: Icon(FontAwesomeIcons.home, size: 50),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
              child: Text(
                "Yavuz Selim caddesi 6375. Sk. No:818 Kepez/Antalya", 
                style: TextStyle(
                  fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                  ),
            ),
            Container(
              height:100,
              child: Center(
                child: Icon(FontAwesomeIcons.phone, size: 50),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
              child: Text(
                "0 555 555 55 55", 
                style: TextStyle(
                  fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                  ),
            ),
            Container(
              height:100,
              child: Center(
                child: Icon(FontAwesomeIcons.envelope, size: 50),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
              child: Text(
                "salim07@gmail.com", 
                style: TextStyle(
                  fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

