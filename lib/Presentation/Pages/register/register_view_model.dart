import 'package:chat_app/Presentation/Pages/register/register_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewModel extends Cubit<RegisterStates> {
  String userName='';
  String password='';
  String email='';
  String fristName='';
  String lastName='';
  GlobalKey <FormState> formKey=GlobalKey<FormState>();
  RegisterViewModel() :super(RegisterStates(state: states.initial));
void reg()async{
  emit(RegisterStates(state: states.loading));
  if(formKey.currentState!.validate()){
    try{
      final credit=await    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
emit(RegisterStates(state: states.success));
    }on FirebaseAuthException catch(e){
      if(e.code=='email-already-in-use'){
        print('email already in use');
        emit(RegisterStates(state: states.failure));
      }
      else if (e.code=='weak-password'){
        emit(RegisterStates(state: states.failure));

        print('weak-password');

      }else{
        emit(RegisterStates(state: states.failure));

      }
    }
  };


}

}


