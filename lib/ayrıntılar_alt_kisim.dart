import 'package:flutter/material.dart';

class Bilgiler extends StatelessWidget {
  const Bilgiler({
    Key? key,
    required this.title,
    required this.cins,
    required this.price,
  }) : super(key: key);

  final String title, cins;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$title\n",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: cins,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            "\$price",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.blue),
          )
        ],
      ),
    );
  }
}
