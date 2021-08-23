import 'package:flutter/material.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15 * 2.5),
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 20,                                         //DEĞİŞEBİLİR
              right: 20,
              bottom: 36,
            ),
            height: size.height * 0.2 - 27,
            decoration: BoxDecoration(
              color:Colors.blue, 
              borderRadius:BorderRadius.only(
                bottomRight: Radius.circular(36),
                bottomLeft: Radius.circular(36),
              ) ,
          ),
          child: Row(
            children: <Widget>[
              Text(
                'Sokağımıza Hoşgeldiniz',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
                ),
            ],
          ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 15), //değişebilir
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0 , 10),
                    blurRadius: 50,
                    color: Colors.blue.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child:TextField(
                      onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "Arama",
                      hintStyle: TextStyle(
                        color: Colors.blue,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                  ),
                  
                ],
              ),
              ),
              ),
        ],
      ),
    );
  }
}
