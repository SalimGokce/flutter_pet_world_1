import 'package:flutter/material.dart';

import '../ayrıntılar_alt_kisim.dart';
import '../images_and_icons.dart';

class ScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIcons(size: size), 
          Bilgiler(
            title: "Boncuk",
            cins: "Köpek",
            price: 3),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                SizedBox(
                  width: size.width / 2,
                  height: 84,
                  child: TextButton(
                    
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20)
                          ),
                          ),
                      ),
                    onPressed: () {}, 
                    child: Text(
                      "İncele",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        ),
                      ),
                    ),
                ),
                Expanded(child: TextButton(
                  onPressed: () {}, 
                  child: Text("Güncel Durumu")
                  ),
                  ),
              ],
            ),
           // SizedBox(height: 40),
          ],
      ),
    );
  }
}

