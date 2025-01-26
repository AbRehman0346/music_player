import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:music_player/database/authentication.dart';
import 'package:music_player/route_generator.dart';
import 'package:music_player/xutils/xdialogs.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _onLoginPressed() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    // validation
    if(email == ""){
      XDialogs().showSnackBar(context, content: "Email is Required");
    }
    if (password == ""){
      XDialogs().showSnackBar(context, content: "Password is Required");
    }

    try{
      XDialogs.showProgressBar(context);
      await Authentication().login(email, password);
      Navigator.pushAndRemoveUntil(context, RouteGenerator.generateRoute(const RouteSettings(name: Routes.home)), (_)=>false);
    } catch(e) {
      Navigator.pop(context);
      XDialogs().showSnackBar(context, content: "Credentials Invalid");
      log("Exception:::::::::::::::::${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, RouteGenerator.generateRoute(const RouteSettings(name: Routes.register)));
          }, child: const Text("Register"))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            ElevatedButton(
              onPressed: _onLoginPressed,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
