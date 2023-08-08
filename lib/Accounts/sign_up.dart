import 'package:yo_event/views/home.dart';
import 'package:flutter/material.dart';
import '../reusableWidget/reusable_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _passwordController1 = TextEditingController();
  TextEditingController _passwordController2 = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Sign Up",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
        ),
        child: SingleChildScrollView(
          child: Padding(
            // padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),

            child: Column(children: [
              // Center(child: logoWidget("assets/images/bird.jpg"),),
              SizedBox(height: 30),
              reusableTextField("Enter Username ", Icons.person_outline, false,
                  _userNameController),

              SizedBox(height: 30),
              reusableTextField("Enter Email ", Icons.email_outlined, false,
                  _emailTextController),

              SizedBox(height: 20),
              reusableTextField("Enter Password ", Icons.lock_outline, true,
                  _passwordController1),

              SizedBox(height: 20),
              reusableTextField("Confirm Password ", Icons.lock_outline, true,
                  _passwordController2),

              SizedBox(
                height: 20,
              ),
              reusableButtons(
                context,
                false,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
