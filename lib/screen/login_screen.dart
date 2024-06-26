import 'package:first_assignment/screen/home_screen.dart';
import 'package:first_assignment/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String correctEmail = "abc@gmail.com";
  String correctPassword = "12345678";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Sign In',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50.0),

                CustomInputField(
                  hint: "Email",
                  controller: _emailController,
                  inputType: TextInputType.emailAddress,
                 
                ),
                SizedBox(height: 24.0),

                CustomInputField(
                  hint: "Password",
                  controller: _passwordController,
                  obscureText: true,
                 
                ),
                const SizedBox(height: 24.0),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    maximumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_emailController.text == correctEmail &&
                          _passwordController.text == correctPassword) {
                        // Navigate to HomeScreen and replace current screen
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      } else {
                        // Show an error message for incorrect credentials
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Invalid email or password.'),
                          ),
                        );
                      }
                    }
                  },
                  child: Text('Login', style: TextStyle(color: Colors.white)),
                ),

                SizedBox(height: 10.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
                      child: const Text('Forgot Password?'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
