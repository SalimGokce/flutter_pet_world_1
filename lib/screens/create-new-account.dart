import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_pet_world_1/pallete.dart';
import 'package:flutter_pet_world_1/service/auth.dart';
import 'package:flutter_pet_world_1/widgets/background-image.dart';
import 'package:flutter_pet_world_1/widgets/password-input.dart';
import 'package:flutter_pet_world_1/widgets/rounded-button.dart';
import 'package:flutter_pet_world_1/widgets/text-field-input.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateNewAccount extends StatefulWidget {
  @override
  _CreateNewAccountState createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  TextEditingController _usernameCon = TextEditingController();
  TextEditingController _emailCon = TextEditingController();
  TextEditingController _pass1Con = TextEditingController();
  TextEditingController _pass2COn = TextEditingController();
  Auth auth = Auth();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'assets/images/register_bg.png'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.1,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 3,
                            sigmaY: 3,
                          ),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: Colors.grey[400],
                            child: Icon(
                              FontAwesomeIcons.user,
                              color: kWhite,
                              size: size.width * 0.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.08,
                      left: size.width * 0.56,
                      child: Container(
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: kBlue,
                          shape: BoxShape.circle,
                          border: Border.all(color: kWhite, width: 2),
                        ),
                        child: Icon(
                          FontAwesomeIcons.arrowUp,
                          color: kWhite,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.width * 0.1,
                ),
                Column(
                  children: [
                    TextInputField(
                      controller: _usernameCon,
                      icon: FontAwesomeIcons.user,
                      hint: 'Kullanıcı',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                    ),
                    TextInputField(
                      controller: _emailCon,
                      icon: FontAwesomeIcons.envelope,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                    ),
                    Passwordinput(
                      controller: _pass1Con,
                      icon: FontAwesomeIcons.lock,
                      hint: 'Şifre',
                      inputType: TextInputType.visiblePassword,
                      inputAction: TextInputAction.next,
                    ),
                    Passwordinput(
                      controller: _pass2COn,
                      icon: FontAwesomeIcons.lock,
                      hint: 'Şifre Onayla',
                      inputType: TextInputType.visiblePassword,
                      inputAction: TextInputAction.done,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    RoundedButton(
                      context: context,
                        btname: 'Kayıt Ol',
                        fn: auth.emailkayit,
                        email: _emailCon.text,
                        password: _pass1Con.text== _pass2COn.text ?_pass1Con.text:""),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Zaten hesabınız var mı?',
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: Text(
                            'Oturum Aç',
                            style: kBodyText.copyWith(
                                color: kBlue, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
