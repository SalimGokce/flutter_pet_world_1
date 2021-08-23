import 'package:flutter/material.dart';

class Amac extends StatelessWidget {
  const Amac({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: Colors.amber,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Amaçlarım"),
              centerTitle: true,
              background:
                  Image.asset("assets/images/kopek3.png", fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Text("selam dünya",
                    style: Theme.of(context).textTheme.bodyText1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
