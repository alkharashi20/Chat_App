import 'package:chat_app/data/database/database_utils.dart';
import 'package:chat_app/data/model/MyUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier{
  MyUser? user;
  User? FirebaseUser;
UserProvider(){
  FirebaseUser=FirebaseAuth.instance.currentUser;
  inituser();
}

inituser()async{
  if(FirebaseUser!=null){
    user =await databaseutils.getuser(FirebaseUser?.uid??"");
  }
}}