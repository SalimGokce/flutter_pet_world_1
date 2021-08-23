import 'dart:io';

import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'geolocator_controller.dart';

class GeoPage extends StatefulWidget {
  @override
  _GeoPageState createState() => _GeoPageState();
}

class _GeoPageState extends State<GeoPage> {
  final geolocatorController = Get.put(GeolocatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Current Location'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green
                ),
                onPressed: () => getLocation(),
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                    child: Icon(Icons.map)),
              ),
             SizedBox(height: 50,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.green
                ),
                onPressed: () {
                  print('x: ${geolocatorController.currentLocation!.latitude}, y: ${geolocatorController.currentLocation!.longitude}');
                },
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                    child: Text('Show')),
              ),
            ],
          ),
        ));
  }

  getLocation() {
    Geolocator.requestPermission().then((request) {
      print("REQUEST : $request");
      if (Platform.isIOS) {
        if (request != LocationPermission.whileInUse) {
          print("NOT LOCATION PERMISSION");
          return;
        } else {
          print("PERMISSION OK");
          geolocatorController.permissionOK();
        }
      } else {
        if (request != LocationPermission.always) {
          print("NOT LOCATION PERMISSION");
          return;
        } else {
          print("PERMISSION OK");
          geolocatorController.permissionOK();
        }
      }
    });
  }
}