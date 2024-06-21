import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              _username(),
              SizedBox(height: 16.0),
              _password(),
              SizedBox(height: 16.0),
              _loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _username() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        controller: _usernameController,
        decoration: InputDecoration(
          hintText: "Input Username",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.orangeAccent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.orangeAccent),
          ),
        ),
      ),
    );
  }

  Widget _password() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Input Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.orangeAccent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.orangeAccent),
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: () {
        String username = _usernameController.text;
        String password = _passwordController.text;
        // Lakukan aksi login dengan username dan password
        print("Username: $username, Password: $password");
      },
      child: Text("Login"),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}
