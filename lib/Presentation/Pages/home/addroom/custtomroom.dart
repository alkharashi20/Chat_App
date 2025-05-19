import 'package:chat_app/data/model/RoomModel.dart';
import 'package:flutter/material.dart';

class custtomroom extends StatelessWidget {
   custtomroom({super.key,required this.roomModel});
RoomModel roomModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      height: MediaQuery.of(context).size.height*0.2,
      width: MediaQuery.of(context).size.width*0.1,
      child: Column(
        children: [
          Image(image: AssetImage('assets/${roomModel.CategoryId}.png'),height: 100,width: 100,),
          SizedBox(height: 12,),
          Text(roomModel.name,style: TextStyle(

            fontSize: 20
          ),),
        ],
      )
    );
  }
}
