import 'package:apphackathon/Screens/register_screen.dart';
import 'package:apphackathon/helpless/menu.dart';
import 'package:apphackathon/model/user_modal.dart';
import 'package:flutter/material.dart';

import 'alunos_screen.dart';

class ProfHomeScreen extends StatefulWidget {

  final User user;

  ProfHomeScreen({this.user});

  @override
  _ProfHomeScreenState createState() => _ProfHomeScreenState();
}

class _ProfHomeScreenState extends State<ProfHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('Bem Vindo, ${widget.user.nome}'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 32),
            alignment: Alignment.topCenter,
            height: 108,
            child: Image.asset('image/logo_inicio.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 148.0),
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 0, crossAxisSpacing: 0),
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen(widget.user)));
                    },
                    child: ButtonMenu(
                      text: 'Atividades',
                      icon: 'image/ATIVIDADES_ICONE.svg',
                      color: Colors.white,
                    )),
                GestureDetector(
                onTap: (){      Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => AlunoScreen(widget.user)));},
                    child: ButtonMenu(
                  text: 'Alunos',
                  icon: 'image/ALUNOS_ICONE.svg',
                  color: Colors.white,
                )),
                GestureDetector(
                    child: ButtonMenu(
                  text: 'Frequências',
                  icon: 'image/FREQUENCIA_ICONE.svg',
                  color: Colors.white,
                )),
                GestureDetector(
                    child: ButtonMenu(
                  color: Colors.white,
                  text: 'Perfil',
                  icon: 'image/PERFIL_ICONE.svg',
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
