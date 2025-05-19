class MyUser{
  static const String collectionName='users';
  String id;
  String fristName;
  String lastName;
  String user;
  String email;
  MyUser({required this.id, required this.email,required this.user,required this.fristName,required this.lastName});
MyUser.fromjson(Map<String,dynamic>data):this(
  id: data['id'],
  email: data['email'],
  user: data['user'],
  fristName: data['fristName'],
  lastName: data['lastName'],
);
Map<String,dynamic>tojson()=>{'id':id,'email':email,'user':user,'fristName':fristName,'lastName':lastName};

}


