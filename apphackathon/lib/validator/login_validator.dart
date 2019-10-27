import 'dart:async';

class LoginValidator{
  final validateUser = StreamTransformer<String, String>.fromHandlers(
      handleData: (user, sink){
        if(user != '' || user != null){
          sink.add(user);
        }else{
          sink.addError("Usuario obrigatório");
        }
      }
  );

  final validatePass = StreamTransformer<String, String>.fromHandlers(
      handleData: (pass, sink){
        if(pass != '' || pass != null){
          sink.add(pass);
        }else{
          sink.addError("Senha obrigatória");
        }
      }
  );
}