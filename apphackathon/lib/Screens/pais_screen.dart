import 'package:apphackathon/Screens/atividade_screen.dart';
import 'package:apphackathon/Screens/notification_screen.dart';
import 'package:apphackathon/helpless/menu.dart';
import 'package:apphackathon/model/user_modal.dart';
import 'package:flutter/material.dart';

class PaisScreenHome extends StatefulWidget {

  final User user;

  PaisScreenHome(this.user);

  @override
  _PaisScreenHomeState createState() => _PaisScreenHomeState();
}

class _PaisScreenHomeState extends State<PaisScreenHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('Bem-Vindo, ${widget.user.nome}'), centerTitle: true, elevation: 0,),
      backgroundColor: Theme.of(context).primaryColor,
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 0, crossAxisSpacing: 0),
        children: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AtividadeScreen(widget.user)));
              },
              child: ButtonMenu(
                text: 'Atividades',
                icon: 'image/ATIVIDADES_ICONE.svg',
                color: Colors.white,
              )),
          GestureDetector(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen(widget.user)));},
              child: ButtonMenu(
                text: 'Notificações',
                icon: 'image/report.svg',
                color: Colors.white,
              )),
          GestureDetector(
              child: ButtonMenu(
                text: 'Perfil',
                icon: 'image/PERFIL_ICONE.svg',
                color: Colors.white,
              )),
        ],
      ),
      );
  }
}
