import 'package:flutter/material.dart';
import 'package:guidance_and_counselling/screens/Register.dart';
import 'package:guidance_and_counselling/components/RoundedButton.dart';
import 'package:guidance_and_counselling/components/RoundedInputField.dart';
import 'package:guidance_and_counselling/components/RoundedPasswordField.dart';
import 'package:guidance_and_counselling/palette.dart';
import 'package:flushbar/flushbar.dart';
import 'package:guidance_and_counselling/screens/Index.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController studentnoController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  bool _shConfirmPass = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50.0),
            Text(
              "Guidance and Counselling",
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1.8,
                  color: Colors.white),
            ),
            headerSection(),
            inputSection(),
            loginButton(),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: InkWell(
                  child: Text(
                    "CREATE ACCOUNT",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (BuildContext context) => Register(),
                        ),
                        (Route<dynamic> route) => true);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //UI Components
  headerSection() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Center(child: Image.asset("assets/images/Mak-Logo.png")),
    );
  }

  inputSection() {
    return Column(
      children: [
        RoundedInputField(
          hintText: "Student Number",
          icon: Icons.mail_outline,
          field: studentnoController,
          fcolor: Colors.white70,
          onChanged: (value) {},
          validate: (value) {},
        ),
        RoundedPasswordField(
          passwordhint: 'Password',
          field: passwordController,
          fcolor: Colors.white70,
          validate: (value) {},
          hideText: _shConfirmPass,
          showHide: () {
            setState(() {
              _shConfirmPass = !_shConfirmPass;
            });
          },
        ),
      ],
    );
  }

  //LogicTrigger
  loginButton() {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(kappSecondary),
            ),
          )
        : RoundedButton(
            text: "SIGN IN",
            color: kappFailed,
            press: () {
              if (studentnoController.text == "" ||
                  passwordController.text == "") {
                Flushbar(
                  message: "Empty field/s found!",
                  icon: Icon(Icons.info_outline, size: 25.0, color: Colors.red),
                  duration: Duration(seconds: 3),
                  leftBarIndicatorColor: Colors.red,
                )..show(context);
              } else {
                setState(() {
                  _isLoading = true;
                });
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (BuildContext context) => Index(),
                    ),
                    (Route<dynamic> route) => false);
              }
            },
          );
  }
}
