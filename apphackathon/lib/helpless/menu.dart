import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonMenu extends StatelessWidget {

  final String icon;
  final String text;
  final Color color;

  ButtonMenu({this.text, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,

        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(icon, height: 108, color: color,),
              Text(
                text,
                style: TextStyle(fontSize: 18, color: color),
              )
            ],
          ),
        ),
      ),
    );
  }
}
