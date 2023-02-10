import 'package:flutter/material.dart';

import '../../bloc/blocs/user_bloc_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController firstnameController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(hintText: "Email"),
          ),
          TextField(
            controller: firstnameController,
            decoration: InputDecoration(hintText: "Fistname"),
          ),
          TextField(
            controller: usernameController,
            decoration: InputDecoration(hintText: "Username"),
          ),
          TextField(
            controller: lastnameController,
            decoration: InputDecoration(hintText: "Lastname"),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(hintText: "Password"),
          ),
          SizedBox(height: 20),
          MaterialButton(
              color: Colors.blue,
              child: const Text("Sign up for gods sake"),
              onPressed: () {
                bloc.registerUser(
                    usernameController.text,
                    firstnameController.text,
                    lastnameController.text,
                    passwordController.text,
                    emailController.text);
              })
        ],
      ),
    ));
  }
}
