import 'dart:convert';

import 'package:apphackathon/helpless/card_help.dart';
import 'package:apphackathon/model/user_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NotificationScreen extends StatefulWidget {

  final User user;
  NotificationScreen(this.user);

  Future<List<dynamic>> _getNot() async {


    http.Response response;
    var body = jsonEncode({'idaluno': user.id});

    response = await http.post('http://192.168.137.1:8080/api/observacao/aluno', body: body,  headers: {"content-type" : "application/json"});

    return json.decode(response.body);
  }

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notificações'), centerTitle: true,),
      body:
         Container(

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
                    future: widget._getNot(),
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
                          if (snapshot.hasError){
                            print(snapshot);
                            return Container();
                          }
                          else
                            return getList(context, snapshot);
                      }
                    }),
              )
            ],
          ),
        ),
      )
    );
  }

  Widget getList(BuildContext context, AsyncSnapshot snapshot) {
    print('bateu');
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index){
          print(snapshot.data);
          return MyCard( prof: snapshot.data[index]['nomeprofessor'], mensagem: snapshot.data[index]['observacao'],);
        });
  }
}
