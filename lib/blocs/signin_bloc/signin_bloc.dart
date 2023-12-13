import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/signup_api.dart';
part 'signin_event.dart';
part 'signin_state.dart';


class SignInBloc extends Bloc<SignInEvent,SignInState>{

  SignInBloc() : super(SignInInitialState()){
    on<SignInCallEvent>(signInApi);
  }


  void signInApi(SignInCallEvent event,Emitter<SignInState> emit)async{
    emit(SignInLoadingState());
    Map<String,dynamic> payload = {
      "email": event.email,
      "password": event.password
    };
    await SignUpApiClass.signInCall(payload).then((value) {
      if(value.isNotEmpty){
        emit(SignInSuccessState(loginData:jsonDecode(value)));
      }else{
        emit(SignInFailureState(msg: SignUpApiClass.msg??"",));
      }

    });
  }

}