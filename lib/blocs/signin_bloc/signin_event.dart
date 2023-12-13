part of 'signin_bloc.dart';

@immutable
abstract class SignInEvent{}

class SignInUpdateEvent extends SignInEvent{}

class SignInCallEvent extends SignInEvent{
   String email = "";
  String password = "";
  SignInCallEvent({required this.email,required this.password});
}


