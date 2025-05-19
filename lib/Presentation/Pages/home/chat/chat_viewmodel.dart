import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/database/database_utils.dart';
import '../../../../data/model/MyUser.dart';
import '../../../../data/model/RoomModel.dart';
import '../../../../data/model/chatModel.dart';
import 'chatstates.dart';

class ChatViewModel extends Cubit<ChatStates> {
  late RoomModel? roomModel;
  late MyUser? Currentuser;
  TextEditingController msg = TextEditingController();

  ChatViewModel({required this.roomModel}) : super(ChatStates(state: states.initial));

  void sendMessage() {
    if ((roomModel?.roomid?.isEmpty ?? true) || msg.text.trim().isEmpty) return;

    emit(ChatStates(state: states.loading));
    final currentUser = FirebaseAuth.instance.currentUser;

    var chat = ChatModel(
      roomid: roomModel?.roomid,
      senderId: currentUser?.uid ?? "test-id",
      receiverId: currentUser?.displayName,
      dateTime: DateTime.now().millisecondsSinceEpoch.toString(),
      message: msg.text,
    );
    databaseutils.insertmsg(chat);
    emit(ChatStates(state: states.success));
    msg.clear();

  }
}
