

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../routes/routes.dart';
import '../../../utils/validator_manager.dart';
import '../../../utils/widgets/CusttomTextFormField.dart';
import 'auth_states.dart';
import 'auth_view_model.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthViewModel(),
      child: BlocBuilder<AuthViewModel, AuthStates>(
        builder: (context, state) {
          final reg = context.read<AuthViewModel>();

          if (state.state == states.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.state == states.success) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showdialog(context, message: 'Success');
              Navigator.pushNamed(context,Routes.login);

            });
          } else if (state.state == states.failure) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showdialog(context, message: 'Failed, try again.');
            });
          }

          return Scaffold(
            body: Stack(
              children: [
                Container(color: Colors.white),
                Image.asset(
                  'assets/background.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Form(
                  key: reg.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CusttomTextFormField(
                        label: 'First Name',
                        hint: 'Enter your first name',
                        validator: ValidatorManager.firstName,
                        onChanged: (value) => reg.fristName = value,
                      ),
                      const SizedBox(height: 5),
                      CusttomTextFormField(
                        label: 'Last Name',
                        hint: 'Enter your last name',
                        validator: ValidatorManager.lastName,
                        onChanged: (value) => reg.lastName = value,
                      ),
                      const SizedBox(height: 5),
                      CusttomTextFormField(

                        label: 'User Name',
                        hint: 'Enter your username',
                        onChanged: (value) => reg.userName = value,
                        validator: ValidatorManager.validateusername,
                      ),
                      const SizedBox(height: 5),
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
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        onPressed: () {
                          reg.reg();
                        },
                        child: const Text(
                          'Register',
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
