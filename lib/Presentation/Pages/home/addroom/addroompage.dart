import 'package:chat_app/Presentation/Pages/auth/auth_states.dart';
import 'package:chat_app/Presentation/Pages/home/addroom/addroom_states.dart';
import 'package:chat_app/data/model/categoryModel.dart';
import 'package:chat_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'addroomViewModel.dart';

class addroompage extends StatefulWidget {
   addroompage({super.key});

  @override
  State<addroompage> createState() => _addroompageState();
}

class _addroompageState extends State<addroompage> {
var get = CategoryModel.getCategories();

CategoryModel? SelectedItem;
@override
  void initState() {
    SelectedItem=get.first;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text('Add Room'),

        ),
      body: BlocProvider<AddRoomViewModel>(create: (context) => AddRoomViewModel(),

        child: BlocBuilder<AddRoomViewModel, AddRoomStates>(

          builder: (BuildContext context, AddRoomStates state) {
            var getviewmodel = context.read<AddRoomViewModel>();

            if(state.stat==states.loading){
              return const Center(child: CircularProgressIndicator(),);
            }else if (state.stat==states.failure){
              return const Center(child: Text('Failed'),);
            }
            return Stack(
            children:[

            Container(color: Colors.white),
            Image.asset(
            'assets/background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            ),
            Container(
            height: 600,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
            ),
            padding: const EdgeInsets.all(18.0),

            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 12,vertical: 35),
            child: Column(
            children: [
            Text('Create New Room',style: TextStyle(fontSize: 20),),
            Image(image: AssetImage('assets/room.png'),),
            SizedBox(height: 15,),
            TextFormField(
              controller: getviewmodel.namecontroller,
            decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter Room Name',
            )),
            SizedBox(
            height: 10,
            ),
            DropdownButton<CategoryModel>

            (
            value: getviewmodel.categorycontroller,

            items: get.map((e) => DropdownMenuItem<CategoryModel>(
            value: e,child: Row(
            children: [
            Text(e.name??""),
            Image(image: AssetImage(e.image??""))
            ],
            ))).toList(), onChanged : (val){
            getviewmodel.categorycontroller=val;
            setState(() {});

            }),
            SizedBox(height: 10,),
            TextFormField(
              controller:getviewmodel.desccontroller,
            decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Description',
            )),
            SizedBox(height: 15,),
            ElevatedButton(

                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 40),
                  backgroundColor: Colors.blue,

                ),
                onPressed: (){
              getviewmodel.addroom();
Navigator.pushNamed(context, Routes.HomeScreen);
            }, child: Text('Add Room',style: TextStyle(
              fontSize: 18,
              color: Colors.white
            ),))
            ],
            ),
            )


            ]);
            }),
      ),
    );
  }
}
