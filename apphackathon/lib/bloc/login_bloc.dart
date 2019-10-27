import 'dart:async';

import 'package:apphackathon/validator/login_validator.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

import '../api.dart';

enum LoginState { IDLE, LOADING, SUCCESS, FAIL }

class LoginBloc extends BlocBase with LoginValidator{
  Api api;

  String error;

  final _userController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _stateController = BehaviorSubject<LoginState>();



  Stream<LoginState> get outState => _stateController.stream;

  Stream<String> get outUser => _userController.stream.transform(validateUser);

  Stream<String> get outPassword =>
      _passwordController.stream.transform(validatePass);


  Function(String) get changeUser => _userController.sink.add;

  Function(String) get changePass => _passwordController.sink.add;

  StreamSubscription _streamSubscription;

  LoginBloc() {

    api = Api();

    _stateController.add(LoginState.IDLE);

  }



  void submit() async {
    print('teste');
    final user = _userController.value;
    final pass = _passwordController.value;
    _stateController.add(LoginState.LOADING);

    if(user == null || pass == null){
      error = 'Preencha Todos os Campos!';
      print(error);
      _stateController.add(LoginState.FAIL);
    }else{


    }
  }

  @override
  // ignore: must_call_super
  void dispose() {
    _userController.close();
    _passwordController.close();
    _stateController.close();

    try {
      _streamSubscription.cancel();
    } catch (e) {
      print(e);
    }
  }
}