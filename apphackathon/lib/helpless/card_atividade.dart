import 'package:flutter/material.dart';

class MyListEntry extends StatelessWidget {

  final String prof;
  final String aluno;
  final String ativ;
  final String data;
  final String taf;

  MyListEntry({this.prof, this.aluno, this.data, this.ativ, this.taf});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0),
      child: Container(

        decoration: BoxDecoration(
            color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 12),
        height: 256,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Professor: $prof', style: TextStyle(fontSize: 16),),
                    Text('Aluno: $aluno', style: TextStyle(fontSize: 16),),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 16),
                child: Text('$data', style: TextStyle(fontSize: 18)),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Atividade:', style: TextStyle(fontSize: 18)),
                    Text('$ativ', style: TextStyle(fontSize: 22)),
                    Text('Tarefa:', style: TextStyle(fontSize: 18)),
                    Text('$taf', style: TextStyle(fontSize: 22))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}