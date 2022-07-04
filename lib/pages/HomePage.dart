// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors

import 'package:app/Model/userModel.dart';
import 'package:app/pages/creatuser.dart';
import 'package:app/pages/reuseble.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController name = TextEditingController();
  TextEditingController Password = TextEditingController();

  Signin() {
    String mail = name.text.trim();
    String passcode = Password.text.trim();
    if (mail.isNotEmpty || passcode.isNotEmpty) {
      Apicall(context, mail, passcode);
    } else {
      snak(context, "All fields are required");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset("assets/Unt.png"),
              ),
              txt("Let's Sign You in.", 40.0, Colors.black, FontWeight.bold),
              sizebox(size.height / 80),
              txt("Welcom back.\nYou have been missed!", 18.0, Colors.black,
                  FontWeight.normal),
              sizebox(size.height / 40),
              textfild("Name", name),
              sizebox(size.height / 80),
              textfild("Password", Password),
              sizebox(size.height / 50),
              Align(
                alignment: Alignment.topRight,
                child: txt(
                    "Recover Password", 15.0, Colors.black, FontWeight.normal),
              ),
              sizebox(size.height / 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  txt("Don't have an account? ", 15.0, Colors.black,
                      FontWeight.normal),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: txt(
                        "Sign up", 15.0, Color(0xffFFB61D), FontWeight.normal),
                  )
                ],
              ),
              sizebox(10),
              InkWell(
                onTap: Signin,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffFFB61D),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  width: size.width,
                  padding: EdgeInsets.all(15),
                  child: Center(
                    child: txt("Sign in", 18.0, Colors.white, FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
