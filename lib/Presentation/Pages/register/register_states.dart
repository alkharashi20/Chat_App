import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum states {success , failure , loading, initial}
class RegisterStates extends Equatable{
  states state;
  RegisterStates({required this.state});

  @override
  // TODO: implement props
  List<Object?> get props =>[state];

}


// abstract class RegisterStates{}
// class RegisterInitialState extends RegisterStates{}
// class RegisterLoadingState extends RegisterStates{}
// class RegisterSuccessState extends RegisterStates{
//   UserCredential firebaseAuth;
//   RegisterSuccessState({required this.firebaseAuth});
// }
// class RegisterFailureState extends RegisterStates{}