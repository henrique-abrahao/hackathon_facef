import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCard extends StatelessWidget {
  
  final String mensagem;

  final String prof;
  
  MyCard({this.mensagem, this.prof});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3.0),
      child: Card(

        child: Container(
          height: 90,
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  maxRadius: 36,
                  child: SvgPicture.asset('image/PERFIL_ICONE.svg', width: 36,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('$mensagem', style: TextStyle(fontSize: 18),),
                    Text('$prof', style: TextStyle(color: Colors.black54),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
