import 'package:chatapptute/components/my_button.dart';
import 'package:chatapptute/components/my_textfield.dart';
import 'package:flutter/material.dart';

import '../services/auth/auth_service.dart';

class RegisterPage extends StatelessWidget {
  //email and pw text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  FocusNode myFocusNode = FocusNode();

  //tap to go to login page
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  //register method
  void register(BuildContext context) async {
    // get aut service
    final _auth = AuthService();

    // passwords match -> create user
    if (_pwController.text == _confirmPwController.text) {
      try {
        await _auth.signUpWithEmailPassword(
          _emailController.text,
          _pwController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
      }
    }
    //passwords don't match -> show error to user

    else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: Text("Passwords don't match"),
        ),
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 63,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 56),
            //welcome back message
            Text(
              "Let's create an account for you",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 21),

            //email textfield
            MyTextField(
              hintText: 'Email',
              obscureText: false,
              controller: _emailController,
            ),

            const SizedBox(height: 7),

            //pw textfield
            MyTextField(
              hintText: 'Password',
              obscureText: true,
              controller: _pwController,
            ),

            const SizedBox(height: 7),

            //confirm pw textfield
            MyTextField(
              hintText: 'Confirm password',
              obscureText: true,
              controller: _confirmPwController,
            ),

            const SizedBox(height: 28),

            //login button
            MyButton(text: 'Register', onTap: () => register(context)),

            //register now
            SizedBox(height: 28),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
