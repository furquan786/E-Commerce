// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:e_commerce/pages/home_page.dart';
import 'package:e_commerce/pages/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool buttonchanged = false;
  final _formkey = GlobalKey<FormState>();
  movehome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        buttonchanged = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
      setState(() {
        buttonchanged = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                'images/login.png',
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Welcome $name',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.8,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 18.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        return value!.isEmpty
                            ? "username can't be empty "
                            : null;
                        //value.length < 6 ? "password shoud be >6 " : null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter username",
                        label: Text("UserName"),
                      ),
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        return value!.isEmpty
                            ? "passwor can't be empty "
                            : value.length < 6
                                ? "password can't be <6 "
                                : null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        label: Text("Password"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        print("hello");
                        movehome(context);
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: 50,
                        width: buttonchanged ? 50 : 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          // shape:
                          //     buttonchanged ? BoxShape.circle : BoxShape.rectangle,
                          borderRadius:
                              BorderRadius.circular(buttonchanged ? 150 : 6),
                        ),
                        child: buttonchanged
                            ? Icon(
                                Icons.check,
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
