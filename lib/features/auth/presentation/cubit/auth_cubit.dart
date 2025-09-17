import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bookia/core/services/API/api_endPoints.dart';
import 'package:bookia/core/services/API/dio_provider.dart';
import 'package:bookia/features/auth/data/models/request/auth_parms.dart';
import 'package:bookia/features/auth/data/models/response/auth_response/auth_response.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';

class Auth_Cubit extends Cubit<Auth_State> {
  Auth_Cubit() : super(AuthInitialState());

  //Register
  var FormKeyRegister = GlobalKey<FormState>();
  var name = TextEditingController();
  var emailRegister = TextEditingController();
  var passRegister = TextEditingController();
  var confirmPass = TextEditingController();

  //login
  var emailLogin = TextEditingController();
  var passwordLogin = TextEditingController();
  var formKeyLogin = GlobalKey<FormState>();
  bool isLoading = false;

  //forget Password
  var FormKeyPass = GlobalKey<FormState>();
  var emailForgetPassword = TextEditingController();
  var OTPKey = GlobalKey<FormState>();
  var OTP = TextEditingController();


//new password 
  var FormKeyNewPass = GlobalKey<FormState>();
  var Newpass = TextEditingController();
  var confirmNewPass = TextEditingController();

  login() async {
    emit(AuthLoadingState());
    //await Future.delayed(Duration(seconds: 1));
    var params = AuthParams(
      email: emailLogin.text,
      password: passwordLogin.text,
    );
    var res = await Auth_Repo.login(params);

    if (res != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState('error'));
    }
  }

  register() async {
    emit(AuthLoadingState());
    //  await Future.delayed(Duration(seconds: 1));

    log('log cubit');
    var params = AuthParams(
      confirm_password: confirmPass.text,
      email: emailRegister.text,
      password: passRegister.text,
      name: name.text,
    );
    var res = await Auth_Repo.register(params);
    if (res != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState('error'));
    }
  }

  forget_password() async {
    emit(AuthLoadingState());
    var params = AuthParams(email: emailForgetPassword.text);
    var res = await Auth_Repo.forget_password(params);
    if (res != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState('error forget password'));
    }
  }

  check_OTP() async {
    emit(AuthLoadingState());

    var params = AuthParams(
      verify_code: int.parse(OTP.text),
      email: emailForgetPassword.text,
    );

    var res = await Auth_Repo.check_OTP(params);

    if (res != null) {
      emit(AuthSuccessState());

    } else {
      emit(AuthErrorState('error check otp'));

    }
  }
  
  new_password()async{
    emit(AuthLoadingState());
    var params = AuthParams(
      verify_code: int.parse(OTP.text),
      Newpassword: Newpass.text,
      confirm_Newpassword: confirmNewPass.text
    );

    var res = await Auth_Repo.new_password(params);

    if (res != null) {

      emit(AuthSuccessState());
    } else {

      emit(AuthErrorState('error new password'));
    }
  }
}
