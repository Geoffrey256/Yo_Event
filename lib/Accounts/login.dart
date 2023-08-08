import 'package:yo_event/Accounts/sign_up.dart';
import 'package:flutter/material.dart';
import '../reusableWidget/nav_bar.dart';
import '../reusableWidget/reusable_widget.dart';
// import 'package:yo_event/Accounts/home.dart';
// import 'package:yo_event/ReusableWidgets/colors.dart';

class login extends StatefulWidget {
  const login({super.key});
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        color: Colors.blueGrey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            // padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: [
                // Center(child: logoWidget("assets/images/bird.jpg"),),
                SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter Username", Icons.person_outline, false,
                    _emailTextController),
                SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordController),
                SizedBox(
                  height: 20,
                ),
                reusableButtons(context, true, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Navigation_Bar()));
                }),
                SizedBox(
                  height: 40,
                ),
                signup(), //BUTTONS
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have Account?     ",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUpPage()));
          },
          child: Text(
            "SIGN UP",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
