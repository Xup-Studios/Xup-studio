import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:xupstore/auth/auth_service.dart';
import 'package:xupstore/views/dashboard.dart';

import 'package:xupstore/views/Auth/register.dart';

import 'package:xupstore/widgets/text_fields.dart';

class Login extends StatelessWidget {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _pwcontroller = TextEditingController();

  final RoundedLoadingButtonController LoginbtnController =
      RoundedLoadingButtonController();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.games,
                size: 60,
                color: Colors.purple,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome to Xup Store!",
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              MyTextField(
                controller: _emailcontroller,
                label: Text(
                  "Email",
                  style: GoogleFonts.poppins(),
                ),
                icn: Icon(Icons.email_outlined),
                obscuretext: false,
              ),
              SizedBox(
                height: 10,
              ),
              MyTextField(
                  controller: _pwcontroller,
                  label: Text(
                    "Password",
                    style: GoogleFonts.poppins(),
                  ),
                  icn: Icon(Icons.password_outlined),
                  obscuretext: true),
              SizedBox(
                height: 10,
              ),
              RoundedLoadingButton(
                width: 2000,
                borderRadius: 10,
                controller: LoginbtnController,
                color: (Colors.grey.shade600),
                onPressed: () async {
                  final authService = AuthService();

                  try {
                    await authService.SignInWithEmailPassword(
                            _emailcontroller.text, _pwcontroller.text)
                        .then(
                      (value) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Dashboard(),
                            ));
                      },
                    );
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          AlertDialog(title: Text(e.toString())),
                    );
                    LoginbtnController.reset();
                  }

                  // Timer(Duration(seconds: 3), () {
                  //   LoginbtnController.success();
                  //   Navigator.pushReplacement(
                  //       context,
                  //       PageTransition(
                  //           type: PageTransitionType.fade, child: Login()));
                  // });
                },
                child: Text(
                  "Login",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member? ",
                    style: GoogleFonts.poppins(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register(),
                          ));
                    },
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
