import 'package:ecommerce/products.dart';
import 'package:flutter/material.dart';

import 'components/button.dart';
import 'components/textfield.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoggedIn = false;

  void _login() {
    if (_usernameController.text == 'admin' && _passwordController.text == '123456') {
      setState(() {
        _isLoggedIn = true;
       
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsScreen()),);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid username or password.'),
            actions: <Widget>[
              MyButton(
                 text: 'OK',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Center(
        child: _isLoggedIn
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome, admin!',
              style: TextStyle(fontSize: 24.0),
            ),
            MyButton(
              text:'Logout',
              onPressed: () {
                setState(() {
                  _isLoggedIn = false;
                });
              },
            ),
          ],
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[200],
              ),
              child: MyTextField(
                controller: _usernameController, hintText: '', obsecureText: false,
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[200],
              ),
              child: MyTextField(
                controller: _passwordController,
                hintText: 'Password',
                obsecureText: true,
              ),
            ),
            SizedBox(height: 16.0),
            MyButton(
              text:'Login',
              onPressed: _login,

            ),
          ],
        ),

      ),
    );
  }
}




