class ChatModel{
  static String collectionName='chat';
  String? roomid;
  String? senderId;
  String? receiverId;
  String? dateTime;
  String? message;
  ChatModel({required this.roomid,required this.senderId,required this.receiverId,required this.dateTime,required this.message});

  ChatModel.fromjson(Map<String,dynamic>data):this(
    roomid: data['roomid'],

    senderId: data['senderId'],
    receiverId: data['receiverId'],
    dateTime: data['dateTime'],
    message: data['message'],
  );
  Map<String,dynamic>tojson()=>{'roomid':roomid,'senderId':senderId,'receiverId':receiverId,'dateTime':dateTime,'message':message};

}