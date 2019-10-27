import 'dart:convert';

import 'package:apphackathon/Screens/home_prof_screen.dart';
import 'package:apphackathon/api.dart';
import 'package:apphackathon/helpless/input_helpless.dart';
import 'package:apphackathon/model/user_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AlunoScreen extends StatefulWidget {
  TextEditingController controllerAluno = TextEditingController();
  TextEditingController controllerObs = TextEditingController();
  Api api = Api();
  final User user;

  AlunoScreen(this.user);

  @override
  _AlunoScreenState createState() => _AlunoScreenState();
}



class _AlunoScreenState extends State<AlunoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alunos'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 56,
            ),
            Container(
              color: Colors.white,
              child: TextField(
                controller: widget.controllerAluno,
                style: TextStyle(color: Theme
                    .of(context)
                    .primaryColor),
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme
                          .of(context)
                          .primaryColor,
                      width: 0.8,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Theme
                        .of(context)
                        .primaryColor, width: 0.8),
                  ),

                  hintText: 'Digite o Código do Aluno',
                  hintStyle: TextStyle(color: Theme
                      .of(context)
                      .primaryColor),
                ),
              ),
            ),
            SizedBox(
              height: 36,
            ),
               TextField(
                controller: widget.controllerObs,
                  maxLines: 7,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 0.8,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 0.8),
                    ),
                    hintText: 'Observações Sobre o aluno',
                    hintStyle:
                    TextStyle(color: Theme.of(context).primaryColor),
                  )),
            SizedBox(
              height: 36,
            ),
            SizedBox(
              height: 58,
              width: double.infinity,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  widget.api.addObs(idaluno: int.parse(widget.controllerAluno.text), idprofessor: widget.user.id, observacao: widget.controllerObs.text);
                  if(widget.api.error == 'salvei') Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfHomeScreen(user: widget.user,)));
                  },
                child: Text(
                  'Enviar',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
