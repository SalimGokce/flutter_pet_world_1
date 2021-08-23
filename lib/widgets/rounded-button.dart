import 'package:flutter/material.dart';
import 'package:flutter_pet_world_1/screens/login-screen.dart';

//import 'package:flutter_pet_world_1/anasayfa.dart';

import '../pallete.dart';

class RoundedButton extends StatefulWidget {
  final String btname, email, password;
  final fn;
  final BuildContext context;
  const RoundedButton({
    Key? key,
    required this.btname,
    required this.email,
    required this.password,
    required Future<String> Function(String, String) this.fn,
    required this.context,
  }) : super(key: key);
  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
      ),
      child: TextButton(
        onPressed: () async {
          Future<String> fn = widget.fn(widget.email, widget.password);
          fn.then((uid) {
            if (uid != "")
              Navigator.pushNamed(widget.context, "/anasayfa");
            else
              print("Hata");
          });
        },
        child: Text(
          widget.btname,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
