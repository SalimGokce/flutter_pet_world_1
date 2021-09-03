import 'package:flutter/material.dart';
import 'package:flutter_pet_world_1/service/auth.dart';
import 'package:flutter_pet_world_1/widgets/CategoryCard.dart';
import 'package:flutter_pet_world_1/yanmenu.dart';
import 'package:share/share.dart';

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  Auth auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pet World",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              auth.oturumKapat();
              print("Oturum kapandı");
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          IconButton(
            onPressed: () {
              Share.share("Pet World Mobil Uygulamamı İndirdiniz mi?");
            },
            icon: Icon(Icons.share),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
          
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "PET WORLD HOŞGELDİNİZ",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "KEDİLER",
                          svgSrc: "assets/icons/flower.svg",
                          press: () {}, key: null,
                        ),
                        CategoryCard(
                          title: "KÖPEKLER",
                          svgSrc: "assets/icons/heart-icon.svg",
                          press: () {}, key: null,
                        ),
                        CategoryCard(
                          title: "HEMEN BUL",
                          svgSrc: "assets/icons/search.svg",
                          press: () {
                            
                          }, key: null,
                        ),
                        CategoryCard(
                          title: "YARDIM ELİ",
                          svgSrc: "assets/icons/sun.svg",
                          press: () {}, key: null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
          ]
        ),
      ),
      drawer: YanMenu(),
    );
  }
}
