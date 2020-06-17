import 'dart:async';

import 'package:formvalidation/src/bloc/validators.dart';

import 'package:rxdart/rxdart.dart';


class LoginBloc with Validators {
  //Se cambio en las sigiuentes propiedades el StreamController por el Behavior
  final _emailController    = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //Recuperar los datos del Stream
  Stream<String> get emailStream     => _emailController.stream.transform(validarCorreo);
  Stream<String> get passwordStream  => _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream => Rx.combineLatest2(emailStream, passwordStream, (e, p)=> true);

  //Insertar valores al Stream
  Function(String) get changeEmail     => _emailController.sink.add;
  Function(String) get changePassword  => _passwordController.sink.add;

  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }
}