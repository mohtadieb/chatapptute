import 'package:chatapptute/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              "Welcome back, you've been missed",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 21),

            //email textfield
            MyTextField(hintText: 'Email',),
            const SizedBox(height: 7,),

            //pw textfield
            MyTextField(hintText: 'Password',),
            //login button

            //register now

          ],
        ),
      ),
    );
  }
}
