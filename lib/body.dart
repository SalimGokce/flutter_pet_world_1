import 'package:flutter/material.dart';
import 'package:flutter_pet_world_1/hayvan_bilgisi/hayvan_listesi.dart';

import 'package:flutter_pet_world_1/recomends_animals.dart';
import 'package:flutter_pet_world_1/title_with_more_btn.dart';

import 'hayvanlar_alt_kisim.dart';
import 'header_with_search_box.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(
            title: "Sokak Hayvanları",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Hayvanlistesi()));
            },
          ),
          RecomendsAnimals(),
          TitleWithMoreBtn(
              title: "Benzer Hayvanlar",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Hayvanlistesi()));
              }),
          HayvanlarAltKisim(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
