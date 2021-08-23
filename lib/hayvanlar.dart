import 'package:flutter/material.dart';
import 'package:flutter_pet_world_1/body.dart';

import 'bottom_nav_bar.dart';

class Hayvanlar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: BottomNavBar(),
   );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Hayvanlar"),
 );
  }
}

