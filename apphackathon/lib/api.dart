import 'dart:convert';
import 'dart:io';
import 'package:apphackathon/model/user_modal.dart';
import 'package:http/http.dart' as http;

class Api {
  http.Response response;
  String error;
  String url = 'http://192.168.137.1:8080/api';
  User user = User();
  int status;

  login({String user, String pass}) async {
    print('chegada1');

    var body = jsonEncode({'codigo': user, "senha": pass});
    response = await http
        .post('$url/usuario', body: body,
        headers: {"content-type": "application/json"});

    print(json.decode(response.body));

    if (response.statusCode == 200) {
      return decode(response);
    } else if (response.statusCode == 400) {
      print('pau');
    } else {
      error = 'Erro interno';
    }
  }

  searchAluno(
      {int idUser, String tarefa, String atividade, String data}) async {
    var body = jsonEncode({
      "atividade": atividade,
      "dataatividade": data,
      "idusuario": idUser,
      "tarefa": tarefa
    });

    response = await http
        .post('$url/atividade', body: body,
        headers: {"content-type": "application/json"});

    if (response.statusCode == 200) {
      error = 'salvei';
    } else if (response.statusCode == 400) {
      print('pau');
    } else {
      error = 'Erro interno';
    }
  }

  addObs({idaluno, idprofessor, observacao}) async{
    var body = jsonEncode(  ({
      "idaluno" : idaluno,
      "idprofessor" : idprofessor,
      "observacao" : observacao}));

    response = await http
        .post('$url/observacao', body: body,
        headers: {"content-type": "application/json"});

    if (response.statusCode == 200) {
      error = 'salvei';
    } else if (response.statusCode == 400) {
      print('pau');
    } else {
      error = 'Erro interno';
    }

  }



  decode(http.Response response) {
    var decoded = json.decode(response.body);
    user = User.fromMap(decoded);
    print('deu bom');
    return user;
  }
}