import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color:Colors.white,
        )  ,
        Image.asset('assets/background.png',fit: BoxFit.cover,
        width: double.infinity,)

      ],
    );
  }
}
