import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class YanMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset("assets/images/sokak_hayvanlari2.jpg"),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.pets),
                    title: Text("PET WORLD"),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/LoginHome");
                    },
                  ),
                  Divider(
                    height: 1.0,
                    color: Colors.blueGrey,
                  ),
                  ListTile(
                    leading: Icon(Icons.pets),
                    title: Text("PROFİLİM"),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/geolocatorr");
                    },
                  ),
                  Divider(
                    height: 1.0,
                    color: Colors.blueGrey,
                  ),
                  ListTile(
                    leading: Icon(Icons.pets),
                    title: Text("HAYVANLAR"),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/hayvanlar");
                    },
                  ),
                  Divider(
                    height: 1.0,
                    color: Colors.blueGrey,
                  ),
                  ExpansionTile(
                    title: Text("HAKKIMDA"),
                    leading: Icon(Icons.pets),
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.pets),
                        title: Text("Kurucu"),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, "/kurucuye");
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.pets),
                        title: Text("Amaçlarım"),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, "/amaclarim");
                        },
                      ),
                    ],
                  ),
                  Divider(
                    height: 1.0,
                    color: Colors.blueGrey,
                  ),
                  ListTile(
                    leading: Icon(Icons.pets),
                    title: Text("İLETİŞİM"),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/iletisim");
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.pets,
                    ),
                    title: Text("HAYVAN HABER"),
                    onTap: () {
                      Navigator.pop(context);
                      _urlAc("https://ajanimo.com/");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future _urlAc(String link) async {
  if (await canLaunch(link)) {
    await launch(link);
  } else {
    debugPrint("Linki Açamıyorum");
  }
}
