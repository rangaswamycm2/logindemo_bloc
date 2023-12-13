part of 'signin_bloc.dart';

abstract class SignInState{

}

class SignInInitialState extends SignInState{

}
class SignInLoadingState extends SignInState{

}
class SignInSuccessState extends SignInState{
  Map<String,dynamic> loginData = {};
  SignInSuccessState({required this.loginData});
}
class SignInFailureState extends SignInState{
  String msg;
  SignInFailureState({required this.msg,});
}


