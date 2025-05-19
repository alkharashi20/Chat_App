import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../data/database/database_utils.dart';
import '../../../../data/model/RoomModel.dart';
import '../../../../data/model/chatModel.dart';
import 'chat_viewmodel.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key, this.roomModel});
  final RoomModel? roomModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(roomModel?.name ?? ""),
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => ChatViewModel(roomModel: roomModel),
        child: StreamBuilder<QuerySnapshot<ChatModel>>(
          stream: databaseutils.getmsg(roomModel?.roomid ?? ""),
          builder: (
              BuildContext context,
              AsyncSnapshot<QuerySnapshot<ChatModel>> snapshot,
              ) {
            var get = context.read<ChatViewModel>();

            if (snapshot.connectionState == ConnectionState.waiting) {

              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error'));
            } else {
              var chat = snapshot.data?.docs.map((e) => e.data()).toList();

              return chat == null
                  ? const Center(child: Text('No Chat'))
                  : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: chat.length,
                      itemBuilder: (context, index) {
                       bool isme= chat[index].senderId==FirebaseAuth.instance.currentUser?.uid;
                        return Row(
                          mainAxisAlignment: isme?MainAxisAlignment.end:MainAxisAlignment.start,
                          children:[Container(
                            width: MediaQuery.of(context).size.width * 0.5,

                            margin: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color:isme? Colors.blue:Colors.grey,
                              borderRadius:  BorderRadius.only(
                                topRight:isme? Radius.circular(10):Radius.zero,
                                bottomRight:isme? Radius.zero: Radius.circular(10),
                              ),
                            ),
                            child:Column(
                              children: [
                                Text(chat[index].message.toString()),
Text(                                formatTimestamp(chat[index].dateTime??"",),style: const TextStyle(fontSize: 8),),
                              ],
                            ),
                          ),]
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: get.msg,
                            decoration: const InputDecoration(
                              hintText: 'Type a message...',
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            get.sendMessage(); // غيّر اسم الدالة لو حبيت
                          },
                          icon: const Icon(Icons.send),
                        )
                      ],
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }

  formatTimestamp(String? dateTime) {
    if (dateTime == null) {
      return '';

  }

    final formattedDate = DateTime.fromMillisecondsSinceEpoch(int.parse(dateTime));
    return DateFormat('yyyy-MM-dd – HH:mm').format(formattedDate ); }

}
