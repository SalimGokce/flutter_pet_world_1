import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_pet_world_1/pallete.dart';
import 'package:flutter_pet_world_1/service/auth.dart';
//import 'package:flutter_pet_world_1/service/auth.dart';
import 'package:flutter_pet_world_1/widgets/background-image.dart';
import 'package:flutter_pet_world_1/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailCon = TextEditingController();
  TextEditingController _passCon = TextEditingController();
  Auth auth = Auth();

  @override
  void didChangeDependencies() {
    if (auth.userCheck()) Future.delayed(Duration(seconds: 1),()=>Navigator.pushNamed(context, "/anasayfa"));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(
          image: 'assets/images/login_bg.png',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    "Pet World",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextInputField(
                    controller: _emailCon,
                    icon: FontAwesomeIcons.envelope,
                    hint: "Email",
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                  ),
                  Passwordinput(
                    controller: _passCon,
                    icon: FontAwesomeIcons.lock,
                    hint: "Şifre",
                    inputType: TextInputType.visiblePassword,
                    inputAction: TextInputAction.done,
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, "/forgotpassword"),
                    child: Text(
                      "Parolanızı mı unuttunuz?",
                      style: kBodyText,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  RoundedButton(
                    context: context,
                    btname: "Giriş Yap",
                    fn: auth.girisyap,
                    email: _emailCon.text,
                    password: _passCon.text,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.popAndPushNamed(context, "/createnewaccount"),
                child: Container(
                  child: Text(
                    "Yeni Hesap Oluştur",
                    style: kBodyText,
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(width: 1, color: kWhite))),
                ),
              ),
              
              SizedBox(
                height: 20,
              )
            ],
          ),
        )
      ],
    );
  }
}
