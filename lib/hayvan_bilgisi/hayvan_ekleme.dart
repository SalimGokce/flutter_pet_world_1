import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet_world_1/maps/geolocator_controller.dart';
import 'package:flutter_pet_world_1/service/locations_app.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class HayvanEkleme extends StatefulWidget {
  const HayvanEkleme({Key? key}) : super(key: key);

  @override
  _HayvanEklemeState createState() => _HayvanEklemeState();
}

class _HayvanEklemeState extends State<HayvanEkleme> {
  File? _image;
  final geolocatorController = Get.put(GeolocatorController());

  TextEditingController nameCt = TextEditingController();
  TextEditingController adressCt = TextEditingController();
  TextEditingController genderCt = TextEditingController();
  TextEditingController konumCt = TextEditingController();
  double longitude = 0.0;
  double latitude = 0.0;

  bool imageUploading = false;
  FirebaseStorage storage = FirebaseStorage.instance;
  _imgFromCamera() async {
    PickedFile? image = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      _image = File(image!.path);
      print("Eşitlerdi");
    });
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  void createRecord(String? imageName) {
    print("İamge name => $imageName");
    _firestore //ikinci yöntem
        .collection("animals").add({
      'name': '${nameCt.text}',
      'adress': '${adressCt.text}',
      'gender': '${genderCt.text}',
      'image_name': '$imageName',
      'latitude':latitude,
      'longitude':longitude
    }).whenComplete(() => print("veri eklendi"));
  }

  _imgFromGallery() async {
    PickedFile? image = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = File(image!.path);
    });
  }

  Future upload() async {
    final String fileName = path.basename(_image!.path);
    String? url;

    var uploadValue = await storage.ref(fileName).putFile(
        _image!,
        SettableMetadata(customMetadata: {
          'uploaded_by': 'A bad guy',
          'description': 'Some description...'
        }));
    uploadValue.ref.getDownloadURL().then((value) {
      setState(() {
        url = value;
        print("$url");
      });
      createRecord(
          url);
    });
  }

  LocationApp locationApp = LocationApp();

  //buraya yazacağım kullanırken bu rayı kopyala yapıştır direk
  /*

  Şimdi bi tane webview plugini bul pub.devden/ sonra onun initialUrl kısmına google maps linkini ver bu linkte lan lot kısmı virgül ile ayrılarak yazar zaten, burdan aldığın konumuo linkteki lan lot kısmına yazarsan uygulama içinde google maps açılır

  WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl:
                    "https://www.google.com/maps/@${locationApp.lat},${locationApp.lon},14z",
              ),
  webview_flutter: ^2.0.12   => bunuda pubspeckyampla ekle,
              webview kodu bu
              gibi
              üstte linkteki lat lon kısmlarını görüyorsun oraya parametre olarak vereceksin

  // Bu widgetlri alarısın, üstteki tanımlamayıda kullanacağın sayfanını void bölümleri yazdığım yere yazarsın alır muhtemelen bende kullanıyorum şimdi çünkü bu kodu, çalışıyor
  Text("Lan = ${locationApp.lan}"),
  Text("Lot = ${locationApp.lot}")

  */

  Future<List<Map<String, dynamic>>> _loadImages() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref().list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "uploaded_by": fileMeta.customMetadata?['uploaded_by'] ?? 'Nobody',
        "description":
            fileMeta.customMetadata?['description'] ?? 'No description'
      });
    });
    return files;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hayvan Ekle"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: _image == null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset("assets/images/kapak.jpg"))
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.file(_image!)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 3,
                        child: ElevatedButton(
                          child: Text("Galeri"),
                          onPressed: () {
                            _imgFromGallery();
                          },
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 3,
                        child: ElevatedButton(
                          child: Text("Kamera"),
                          onPressed: () {
                            _imgFromCamera();
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  textInputs("İsim giriniz", nameCt),
                  SizedBox(
                    height: 10,
                  ),
                  textInputs("Adres giriniz", adressCt),
                  SizedBox(
                    height: 10,
                  ),
                  textInputs("Cinsiyet giriniz", genderCt),
                  SizedBox(height: 20),
                  
                  Container(height: 100,
                  width: MediaQuery.of(context).size.width-50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Text(latitude.toString()),
                            ),
                            Expanded(
                              child: Text(longitude.toString()),
                            )
                          ],
                        ),
                      ),

                      Center(
                        child: IconButton(onPressed: () async {
                                await getLocation();
                                var position = await geolocatorController.getLocation();
                                longitude = position!.longitude;
                                latitude = position.latitude;
                                (context as Element).markNeedsBuild();
                            }, icon: Icon(Icons.location_pin),),
                      )
                    ],
                  ),
                )
                  
                  ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13),
              child: ElevatedButton(
                child: Text("Kaydet"),
                onPressed: nameCt.text.length == 0 &&
                        adressCt.text.length == 0 &&
                        genderCt.text.length == 0 &&
                        konumCt.text.length == 0
                    ? null
                    : () {
                        upload();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HayvanEkleme()));
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textInputs(
      String? hint, TextEditingController? textEditingController) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );
  }

  Future getLocation() async {
    var request = await Geolocator.requestPermission();

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
  }
}
