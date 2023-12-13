
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/signin_bloc/signin_bloc.dart';
import '../utils/app_navigators.dart';
import '../utils/app_widgets.dart';
import 'dashboard.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {

  final SignInBloc signInBloc = SignInBloc();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  double screenWidth = 0.70;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body : BlocConsumer<SignInBloc, SignInState>(
          bloc: signInBloc,
          listener: (context, state) {
            if(state is SignInSuccessState){
              emailController.text = "";
              passwordController.text = "";
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: const Center(child: Text("Login Success")),shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.all(8),
                ),
              );
              AppNavigator.openAndRemoveUntil(context, const DashBoard());
            }
            else if(state is SignInFailureState){

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Center(child: Text(state.msg)),shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.all(8),
                ),
              );
            }
          },
          builder: (context, state) {
            return SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppWidgets.size20h,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * screenWidth,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hello Again!",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24
                              )
                          ),
                          Text("Welcome back"),
                        ],
                      ),
                    ),
                    AppWidgets.size20h,
                    AppWidgets.size20h,
                    SizedBox(
                      // padding: const EdgeInsets.all(8.0),
                      width: MediaQuery.of(context).size.width * screenWidth,
                      child: TextFormField(
                        controller:emailController,
                        validator: (val){
                          if (val == null || val.trim().isEmpty) {
                            return 'Please enter email address';
                          }else if(val.isNotEmpty){
                            final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val);
                            if(emailValid){
                              return null;
                            }
                            else{
                              return 'Please enter correct email address';
                            }
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: const BorderSide(color: Colors.grey)

                            ),
                            isDense: true,
                            hintText: "Email Address",
                            labelText: "Email Address",
                            prefixIcon: const Icon(Icons.email_outlined)

                        ),
                      ),
                    ),
                    AppWidgets.size10h,
                    SizedBox(
                      // padding: const EdgeInsets.all(8.0),
                      width: MediaQuery.of(context).size.width * screenWidth,
                      child: TextFormField(
                        controller:passwordController,
                        obscureText: true,
                        validator: (val){
                          if (val == null || val.isEmpty) {
                            return 'Please enter password'
                            ;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: const BorderSide(color: Colors.grey)
                            ),
                            prefixIcon: const Icon(Icons.lock_sharp),
                            isDense: true,
                            hintText: "Password",
                            labelText: "Password"

                        ),
                      ),
                    ),
                    AppWidgets.size10h,

                    SizedBox(
                      width: MediaQuery.of(context).size.width * screenWidth,
                      height: MediaQuery.of(context).size.width * 0.12,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: (){
                            if(formKey.currentState!.validate()){
                              signInBloc.add(SignInCallEvent(
                                  email: emailController.text,
                                  password: passwordController.text
                              ));
                            }
                          },

                          child: (state is SignInLoadingState)?const CircularProgressIndicator():const Center(
                              child: Text("Login"))),
                    ),
                    AppWidgets.size15h,
                    InkWell(
                        onTap: (){

                        },
                        child: const Text("Forget Password",style: TextStyle(
                            color: Colors.grey
                        ),)),

                  ],
                ),
              ),
            );
          },
        ),

      ),
    );
  }
}
