class RoomModel{
static String collectionName='Rooms';
  String roomid;
  String name;
  String Desc;
  String CategoryId;

  RoomModel({required this.roomid,required this.name,required this.Desc,required this.CategoryId});

  RoomModel.fromjson(Map<String,dynamic>data):this(

    roomid: data['roomid'],
    name: data['name'],
    Desc: data['Desc'],
    CategoryId: data['CategoryId'],
  );
  Map<String,dynamic>tojson()=>{'roomid':roomid,'name':name,'Desc':Desc,'CategoryId':CategoryId};

}