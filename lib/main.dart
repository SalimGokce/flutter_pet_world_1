import 'package:flutter/material.dart';
import 'package:flutter_pet_world_1/amaclarim.dart';
import 'package:flutter_pet_world_1/anasayfa.dart';

import 'package:flutter_pet_world_1/hayvanlar.dart';
import 'package:flutter_pet_world_1/kurucu%C3%BCye.dart';
import 'package:flutter_pet_world_1/screens/details_screen.dart';
import 'package:flutter_pet_world_1/screens/login-screen.dart';

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

class AnaGiris extends StatelessWidget {

  // ignore: unused_field
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
 
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
        //"/iletisim" : (BuildContext context) => Iletisim(),
        "/kurucuye": (BuildContext context) => KurucUye(),
        "/amaclarim": (BuildContext context) => Amac(),
        "/hayvanlar": (BuildContext context) => Hayvanlar(),
        "/details_screen": (BuildContext context) => DetailsScreen(),
        "/geolocatorr":(BuildContext context) => GeoPage(),
        //"/hayvanlistesi": (BuildContext context) => Hayvanlistesi(),
        //'/LoginScreen':(BuildContext context) => LoginScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
