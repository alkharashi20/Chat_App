import 'package:chat_app/Presentation/Pages/home/addroom/addroom_states.dart';
import 'package:chat_app/data/database/database_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/RoomModel.dart';
import '../../../../data/model/categoryModel.dart';

class AddRoomViewModel extends Cubit<AddRoomStates>{
TextEditingController namecontroller=TextEditingController();
TextEditingController desccontroller=TextEditingController();
CategoryModel? categorycontroller;
TextEditingController roomidcontroller=TextEditingController();

  AddRoomViewModel():super(AddRoomStates( stat: state.initial));

  void addroom()async{
    emit(AddRoomStates(stat: state.loading));
    var room=RoomModel(roomid: roomidcontroller.text, name: namecontroller.text, Desc: desccontroller.text, CategoryId: categorycontroller?.id??"");

await databaseutils.RegisterRoom(room);
emit(AddRoomStates(stat: state.success));


  }
}