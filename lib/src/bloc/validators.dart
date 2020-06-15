

import 'dart:async';

class Validators{

  //Siempre es importante indicar que entra y que sale por eso se indica String, entra, String sale
  final validarCorreo = StreamTransformer<String, String>.fromHandlers(
    handleData: (correo, sink){
      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(pattern);
      if(regExp.hasMatch(correo)){
        sink.add(correo);
      } else {
        sink.addError('Este correo no es valido');
      }
    }
  );

  //Siempre es importante indicar que entra y que sale por eso se indica String, entra, String sale
  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if(password.length >= 8){
        sink.add(password);
      }else{
        sink.addError('El password debe ser mayor a 7 caracteres');
      }
    }
  );


}