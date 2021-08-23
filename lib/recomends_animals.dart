import 'package:flutter/material.dart';
import 'package:flutter_pet_world_1/screens/details_screen.dart';

class RecomendsAnimals extends StatelessWidget {
  const RecomendsAnimals({
    
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          HayvanKarti(
            image: "assets/images/kedi1.jpg",
            title: "Boncuk",
            country: "Merkezefendi",
            old: 2,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(),
                ),
              );
            },
          ),
          HayvanKarti(
            image: "assets/images/kopek1.png",
            title: "Fındık",
            country: "Asmalıevler",
            old: 3,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(),
                ),
              );
            },
          ),
          HayvanKarti(
            image: "assets/images/kedi2.jpg",
            title: "Pamuk",
            country: "Çivril",
            old: 5,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class HayvanKarti extends StatelessWidget {
  const HayvanKarti({
    Key? key,
    required this.image,
    required this.title,
    required this.country,
    required this.old,
    required this.press,
  }) : super(key: key);

  final String image, title, country;
  final int old;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 20, top: 10, bottom: 20 * 2.5),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.white,
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: Theme.of(context).textTheme.button,
                        ),
                        TextSpan(
                            text: "$country".toUpperCase(),
                            style: TextStyle(
                              color: Colors.amber.withOpacity(0.5),
                            ))
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '$old',
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(color: Colors.blue),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
