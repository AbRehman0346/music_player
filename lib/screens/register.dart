import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:music_player/constants.dart';
import 'package:music_player/database/authentication.dart';
import 'package:music_player/database/database.dart';
import 'package:music_player/models/user_model.dart';
import 'package:music_player/route_generator.dart';
import 'package:music_player/xutils/xdialogs.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  Future<void> _onRegisterPressed() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    // validation
    if(name == ""){
      XDialogs().showSnackBar(context, content: "Name is required");
    }
    if(email == ""){
      XDialogs().showSnackBar(context, content: "Email is Required");
    }
    if(!email.contains("@")){
      XDialogs().showSnackBar(context, content: "Email is badly Formatted");
    }
    if (password == ""){
      XDialogs().showSnackBar(context, content: "Password is Required");
    }
    if(confirmPassword != password){
      XDialogs().showSnackBar(context, content: "Passwords do not match");
    }

    UserModel user = UserModel(name: name, email: email, password: password, role: "user");

    try{
      XDialogs.showProgressBar(context);
      await Authentication().register(user);
      Navigator.pushAndRemoveUntil(context, RouteGenerator.generateRoute(const RouteSettings(name: Routes.home)), (_)=>false);
    } catch(e) {
      Navigator.pop(context);
      XDialogs().showSnackBar(context, content: "Unknown Error Occurred");
      log("Exception:::::::::::::::::${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text("Login"))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onRegisterPressed,
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
