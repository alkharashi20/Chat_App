import 'package:chat_app/data/model/MyUser.dart';
import 'package:chat_app/data/model/RoomModel.dart';
import 'package:chat_app/data/model/chatModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class databaseutils {
  static CollectionReference<MyUser> getusercollection(){
    return FirebaseFirestore.instance.collection(MyUser.collectionName).withConverter<MyUser>(fromFirestore:(snapshots,options)=>MyUser.fromjson(snapshots.data()!) , toFirestore: (user,options)=>user.tojson());

  }
  static  CollectionReference<RoomModel> getroomCollection(){
    return FirebaseFirestore.instance.collection(RoomModel.collectionName).withConverter(fromFirestore: (snapshots, options)=>RoomModel.fromjson(snapshots.data()!), toFirestore: (room, options)=>room.tojson());

  }

  static CollectionReference<ChatModel> getchat(String id){
    return FirebaseFirestore.instance.collection(RoomModel.collectionName).doc(id).collection(ChatModel.collectionName).withConverter<ChatModel>(fromFirestore: (snapshots,options)=>ChatModel.fromjson(snapshots.data()!), toFirestore: (chat,options)=>chat.tojson());
  }

  static Future<void> insertmsg(ChatModel chat)async{
   var get=await getchat(chat.roomid??"");
   chat.roomid=get.doc().id;
   return get.doc(chat.roomid).set(chat);

  }
  static Stream<QuerySnapshot<ChatModel>>getmsg(String id){

    return getchat(id).orderBy('dateTime').snapshots();
  }
  static Future<void> RegisterRoom(RoomModel room)async{
    var get = await getroomCollection();
    room.roomid=get.doc().id;
    return get.doc(room.roomid).set(room);
  }
  static Future<void> RegisterUser(MyUser user){
 return getusercollection().doc(user.id).set(user);
  }
  static Future<MyUser?> getuser(String id)async{
    var doc=await getusercollection().doc(id).get();
    return doc.data();
  }


static Stream<QuerySnapshot<RoomModel>> getroom(){

return getroomCollection().snapshots();
}
}