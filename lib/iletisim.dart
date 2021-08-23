/*import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Iletisim extends StatefulWidget {
  @override
  _IletisimState createState() => _IletisimState();
}

class _IletisimState extends State<Iletisim> {
  Completer<GoogleMapController> _haritaHazirlayici = 
  Completer<GoogleMapController>();

  Map<MarkerId, Marker> _isaretler= <MarkerId, Marker>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İletişim"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 300.0,
            width: double.maxFinite,
            child: GoogleMap(
              mapType:MapType.normal ,
              markers: Set<Marker>.of(_isaretler.values),
              initialCameraPosition: CameraPosition(
                target: LatLng(22, 22),
                zoom: 17.0,

              ),
              onMapCreated: (GoogleMapController controller){
                _haritaHazirlayici.complete(controller);
                final MarkerId isaretId = MarkerId("merkez");
                final Marker isaret = Marker(
                  markerId: isaretId,
                  position: LatLng(22 , 22),
                  infoWindow: InfoWindow(
                    title: "Hayvan",
                    snippet: "Hayvanımız bu civardadır",
                    onTap: () {
                      debugPrint("işaretleyici tıklandı");
                    },
                  ),
                  
                );
                setState(() {
                  _isaretler[isaretId] = isaret;
                });
              },
              ),
             ),
        
        ],
      ),
    );
  }
}
*/