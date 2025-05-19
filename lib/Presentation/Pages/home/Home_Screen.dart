import 'package:chat_app/Presentation/Pages/home/addroom/custtomroom.dart';
import 'package:chat_app/data/Provider/userprovider.dart';
import 'package:chat_app/data/database/database_utils.dart';
import 'package:chat_app/data/model/MyUser.dart';
import 'package:chat_app/data/model/RoomModel.dart';
import 'package:chat_app/routes/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/auth_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children:[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('WelcomeBack...',style: TextStyle(
                fontSize: 25
              ),),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot<RoomModel>>(stream: databaseutils.getroom(), builder: (context,asyncSnapshot){

                if(asyncSnapshot.connectionState==ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator(),);
                }
                if(asyncSnapshot.hasError){
                  return const Center(child: Text('Error'),);
                }else{
                  var room = asyncSnapshot.data?.docs.map((e)=>e.data()).toList();
                  return room==null?const Center(child: Text('No Rooms'),):GridView.builder(

                    itemCount: room.length,
                    itemBuilder: (context,index){
                      return GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, Routes.chatpage,arguments: room[index]);
                          },
                          child: custtomroom(roomModel: room[index]));
                    }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,),);
                }
              }),
            ),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: (){
          Navigator.pushNamed(context, Routes.addroompage);

        },),

    );
  }
}
