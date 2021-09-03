import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet_world_1/hayvan_bilgisi/hayvan_ekleme.dart';
import 'package:url_launcher/url_launcher.dart';

class Hayvanlistesi extends StatefulWidget {
  @override
  _HayvanlistesiState createState() => _HayvanlistesiState();
}

class _HayvanlistesiState extends State<Hayvanlistesi> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> animals = [];
  Future getData() async {
    _firestore.collection('animals').get().then((value) {
      value.docs.forEach((element) {
        setState(() {
          animals.add(element.data());
        });
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HayvanEkleme()));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: animals.length,
          itemBuilder: (context, index) {
            return AspectRatio(
              aspectRatio: 1.35,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 3,
                          color: Colors.black12,
                          offset: Offset.zero,
                          spreadRadius: 5)
                    ], borderRadius: BorderRadius.circular(35)),
                    child: Card(
                      elevation: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  animals[index]['image_name'],
                                  fit: BoxFit.contain,
                                )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                animals[index]['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 30),
                              Text(
                                animals[index]['gender'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                animals[index]['adress'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 12),
                              ),
                              IconButton(
                                  onPressed: () {
                                    launch(
                                        "https://www.google.com/maps/@${animals[index]['latitude']},${animals[index]['longitude']},14z");
                                  },
                                  icon: Icon(Icons.pin_drop)),
                            ],
                          )
                        ],
                      ),
                    )

                    /*  color: animals['gender'] == true ? Colors.blue : Colors.pink,
                  child: Row(
                    
                    children: [
                      
                    Text(animals['name']),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.width / 2,
                        alignment: Alignment.center,
                        
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(animals['image_name'])
                                
                                ),
                                ),
                      )
                    ],
                  ), */
                    ),
              ),
            );
          },
        ),
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    title: Text("Hayvanlar"),
  );
}
