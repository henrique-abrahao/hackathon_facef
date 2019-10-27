import 'dart:convert';

import 'package:apphackathon/helpless/card_atividade.dart';
import 'package:apphackathon/model/user_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AtividadeScreen extends StatefulWidget {
  final User user;

  AtividadeScreen(this.user);

  @override
  _AtividadeScreenState createState() => _AtividadeScreenState();
}

Future<List<dynamic>> _getAtiv() async {
  http.Response response;

  response = await http.get('http://192.168.137.1:8080/api/atividades/usuarios',
      headers: {"content-type": "application/json"});

  return json.decode(response.body);
}

class _AtividadeScreenState extends State<AtividadeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Atividades'),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("image/bg_login.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: FutureBuilder(
                    future: _getAtiv(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                        case ConnectionState.none:
                          return Container(
                            child: Center(
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.black),
                                strokeWidth: 3,
                              ),
                            ),
                          );
                        default:
                          if (snapshot.hasError) {
                            print(snapshot);
                            return Container();
                          } else
                            return _gerarList(context, snapshot);
                      }
                    }),
              )
            ],
          ),
        ));
  }

  Widget _gerarList(BuildContext context, AsyncSnapshot snapshot) {
    print('bateu');
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          print(snapshot.data);
          String date = snapshot.data[index]['dataatividade'];
          String dateString =
              "${date.substring(8, 10)}/${date.substring(5, 7)}/${date.substring(0, 4)}";
          return MyListEntry(
            taf: snapshot.data[index]['tarefa'],
            ativ: snapshot.data[index]['atividade'],
            data: dateString,
            prof: snapshot.data[index]['nome'],
            aluno: widget.user.nome,
          );
        });
  }
}
