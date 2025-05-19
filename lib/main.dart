import 'package:chat_app/data/Provider/userprovider.dart';
import 'package:chat_app/routes/route_generator.dart';
import 'package:chat_app/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( ChangeNotifierProvider(
      create: (context)=>UserProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    var userprovider = Provider.of<UserProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      onGenerateRoute: RouteGenerator.getRoute,
  initialRoute:userprovider.FirebaseUser==null?Routes.login:Routes.HomeScreen ,
    );

  }}