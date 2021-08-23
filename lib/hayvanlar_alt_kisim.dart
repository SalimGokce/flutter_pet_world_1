import 'package:flutter/material.dart';

class HayvanlarAltKisim extends StatelessWidget {
  const HayvanlarAltKisim({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
                child: Row(
        children: [
          Hayvanlaraltkisim(
            image: "assets/images/kopek5.jpg",
            press: () {},
            ),
            Hayvanlaraltkisim(
            image: "assets/images/kedi3.jpg",
            press: () {},
            ),
            Hayvanlaraltkisim(
            image: "assets/images/kopek4.jpg",
            press: () {},
            ),
        ],
      ),
    );
  }
}

class Hayvanlaraltkisim extends StatelessWidget {
  const Hayvanlaraltkisim({
    Key? key,
    required this.image, required this.press,
  }) : super(key: key);

  final String image;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
          child: Container(
        margin: EdgeInsets.only(left: 20, top: 10, bottom: 10),
        width: size.width * 0.8,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
