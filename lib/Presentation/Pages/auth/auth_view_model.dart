import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_states.dart';

class AuthViewModel extends Cubit<AuthStates> {
  String userName='';
  String password='';
  String email='';
  String fristName='';
  String lastName='';
  GlobalKey <FormState> formKey=GlobalKey<FormState>();
  AuthViewModel() :super(AuthStates(state: states.initial));
void reg()async{
  emit(AuthStates(state: states.loading));
  if(formKey.currentState!.validate()){
    try{
      final credit=await    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
emit(AuthStates(state: states.success));
    }on FirebaseAuthException catch(e){
      if(e.code=='email-already-in-use'){
        print('email already in use');
        emit(AuthStates(state: states.failure));
      }
      else if (e.code=='weak-password'){
        emit(AuthStates(state: states.failure));

        print('weak-password');

      }else{
        emit(AuthStates(state: states.failure));

      }
    }
  };


}

void login()async{
  if(formKey.currentState!.validate()) {
    emit(AuthStates(state: states.loading));

    try {
      final credit = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
      emit(AuthStates(state: states.success));

    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('email already in use');
        emit(AuthStates(state: states.failure));
      }
      else if (e.code == 'weak-password') {
        emit(AuthStates(state: states.failure));
      }else{
        emit(AuthStates(state: states.failure));

      }
    }
  }}}