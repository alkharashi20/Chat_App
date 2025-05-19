import 'package:chat_app/Presentation/Pages/home/Home_Screen.dart';
import 'package:chat_app/Presentation/Pages/auth/login.dart';
import 'package:chat_app/Presentation/Pages/home/addroom/addroompage.dart';
import 'package:chat_app/Presentation/Pages/home/chat/chat_screen.dart';
import 'package:chat_app/data/model/RoomModel.dart';
import 'package:chat_app/routes/routes.dart';
import 'package:flutter/material.dart';

import '../Presentation/Pages/auth/register.dart';




class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:{
return MaterialPageRoute(builder: (_) =>  Login());
      }
      case Routes.register:
        return MaterialPageRoute(builder: (_) =>  RegisterScreen());
        case Routes.HomeScreen:
          return MaterialPageRoute(builder: (_) =>  HomeScreen());
      case Routes.addroompage:
        return MaterialPageRoute(builder: (_) => addroompage());
      case Routes.chatpage:
        var args = settings.arguments as RoomModel;

        return MaterialPageRoute(builder: (_)=>ChatScreen(roomModel: args,));
      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
