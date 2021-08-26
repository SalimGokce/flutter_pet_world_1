import 'package:flutter/material.dart';
import 'package:flutter_pet_world_1/amaclarim.dart';
import 'package:flutter_pet_world_1/anasayfa.dart';

import 'package:flutter_pet_world_1/hayvanlar.dart';
import 'package:flutter_pet_world_1/iletisim.dart';
import 'package:flutter_pet_world_1/kurucu%C3%BCye.dart';
import 'package:flutter_pet_world_1/screens/details_screen.dart';
import 'package:flutter_pet_world_1/screens/login-screen.dart';
import 'package:flutter_pet_world_1/service/locations_app.dart';
import 'package:geolocator/geolocator.dart';

import 'maps/geolocatorr.dart';
import 'screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';

//import 'iletisim.dart';

void main() async {
  //runApp(AnaGiris());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AnaGiris());
}

class AnaGiris extends StatefulWidget {
  // ignore: unused_field
  @override
  _AnaGirisState createState() => _AnaGirisState();
}

class _AnaGirisState extends State<AnaGiris> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  LocationApp locationApp = LocationApp();
  var currentPosi;
  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        currentPosi = position;
        locationApp.lan = currentPosi.latitude;
        locationApp.lot = currentPosi.longitude;
      });
    }).catchError((e) {
      print("Lokasyon alınırken hata oluştu oluşan hata => $e");
    });
  }

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.indigo,
      ),
      //home: LoginScreen(),
      initialRoute: '/',
      routes: {
        "/": (context) => LoginScreen(),
        "/LoginScreen": (context) => LoginScreen(),
        "/forgotpassword": (BuildContext context) => ForgotPassword(),
        "/createnewaccount": (BuildContext context) => CreateNewAccount(),
        "/anasayfa": (BuildContext context) => AnaSayfa(),
        "/iletisim": (BuildContext context) => Iletisim(),
        "/kurucuye": (BuildContext context) => KurucUye(),
        "/amaclarim": (BuildContext context) => Amac(),
        "/hayvanlar": (BuildContext context) => Hayvanlar(),
        "/details_screen": (BuildContext context) => DetailsScreen(),
        "/geolocatorr": (BuildContext context) => GeoPage(),
        //"/hayvanlistesi": (BuildContext context) => Hayvanlistesi(),
        //'/LoginScreen':(BuildContext context) => LoginScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
