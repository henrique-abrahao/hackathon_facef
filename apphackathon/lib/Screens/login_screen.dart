import 'package:apphackathon/Screens/home_prof_screen.dart';
import 'package:apphackathon/Screens/pais_screen.dart';
import 'package:apphackathon/helpless/input_helpless.dart';
import 'package:apphackathon/model/user_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import '../api.dart';

enum LoginState { IDLE, LOADING, SUCCESS, FAIL }

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController passController = TextEditingController();
  final TextEditingController userController = TextEditingController();
  String error;
  Api api = Api();
  User userState = User();


  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('image/bg_login.png'), fit: BoxFit.fill)),
          child: Column(
            children: <Widget>[
              SizedBox(height: 56,),
              Expanded(
                flex: 5,
                child: Container(
                  width: 280,
                  child: Image.asset('image/logo.png',),
                ),
              ),
              Expanded(
                flex: 7,
                child: Column(
                  children: <Widget>[
                    InputHelp(
                      controller: userController,
                      text: 'Usuário',
                      pass: false,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    InputHelp(
                      controller: passController,
                      text: 'Senha',
                      pass: true,
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22.0),
                      child: SizedBox(
                        height: 58,
                        width: double.infinity,
                        child: RaisedButton(
                          color: Theme
                              .of(context)
                              .primaryColor,
                          onPressed:(){
                            _submit(userController.text, passController.text);
                          },
                          child: Text(
                            'Entrar',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  void _submit(user, pass) async{
    if(user == null || pass == null){
      error = 'Preencha Todos os Campos!';
      print(error);

    }else{

      await  api.login(user: user, pass: pass);
      userState = api.user;
      if(userState.professor){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProfHomeScreen(user: userState,)));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PaisScreenHome(userState)));
      };
    }
  }
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(""),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Entendi"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
