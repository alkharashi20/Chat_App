import 'dart:io';

import 'package:chat_app/routes/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/validator_manager.dart';
import '../../../utils/widgets/CusttomTextFormField.dart';
import 'auth_states.dart';
import 'auth_view_model.dart';
import 'dart:io';
class Login extends StatelessWidget {
   Login({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthViewModel(),
      child: BlocListener<AuthViewModel, AuthStates>(
        listener: (context, state) {
          if (state.state == states.success) {
            showdialog(context, message: 'Success');
            Navigator.pushNamed(context,Routes.HomeScreen);

          } else if (state.state == states.failure) {
            showdialog(context, message: 'Failed, try again.');
          }
        },
        child: BlocBuilder<AuthViewModel, AuthStates>(
          builder: (context, state) {
            final reg = context.read<AuthViewModel>();
            return Scaffold(
              body: Stack(
                children: [
                  Container(color: Colors.white),
                  Image.asset(
                    'assets/background.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),

                  if (state.state == states.loading)
                    const Center(child: CircularProgressIndicator()),
                  if (state.state != states.loading)
                    Form(
                      key: reg.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CusttomTextFormField(
                            label: 'Email',
                            hint: 'Enter your Email',
                            onChanged: (value) => reg.email = value,
                            validator: ValidatorManager.validateEmail,
                          ),
                          const SizedBox(height: 5),
                          CusttomTextFormField(
                            obscureText: true,
                            label: 'Password',
                            hint: 'Enter your Password',
                            onChanged: (value) => reg.password = value,
                            validator: ValidatorManager.validatePassword,
                          ),
                          SizedBox(height: 10,),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Dont have an account?'),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context,Routes.register);
                                },
                                child: Text('Register'),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            onPressed: () async{

                              reg.login();

                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
  void showdialog(BuildContext context, {required String message}) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

}