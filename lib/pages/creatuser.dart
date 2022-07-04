// ignore_for_file: avoid_print, use_build_context_synchronously, non_constant_identifier_names, prefer_const_constructors

import 'package:app/pages/HomePage.dart';
import 'package:app/pages/reuseble.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

String? strinfdatas;

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController passwordCheck = TextEditingController();
  TextEditingController first_name = TextEditingController();
  TextEditingController last_name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController phone_number = TextEditingController();

  developerlibs() async {
    String mail = email.text.trim();
    String pass = Password.text.trim();
    String passwordC = passwordCheck.text.trim();
    String fname = first_name.text.trim();
    String lname = last_name.text.trim();
    String uname = username.text.trim();
    String number = phone_number.text.trim();
    if (mail.isNotEmpty ||
        pass.isNotEmpty ||
        passwordC.isNotEmpty ||
        fname.isNotEmpty ||
        lname.isNotEmpty ||
        uname.isNotEmpty ||
        number.isNotEmpty) {
      if (pass == passwordC) {
        try {
          var dio = Dio();
          Response response = await dio.post(
              'https://pacific-fjord-71880.herokuapp.com/users/register',
              data: {
                "email": mail,
                "password": pass,
                "passwordCheck": passwordC,
                "first_name": fname,
                "last_name": lname,
                "username": uname,
                "phone_number": number,
              });
          if (response.statusCode == 200) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
            snak(context, "User Created");
          } else {
            print("dio : error");
            snak(context, "Error");
          }
        } catch (e) {
          print(e.toString());
          snak(context, "User Alredy Created");
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('password is not Match'),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('All fields are required'),
      ));
    }
  }

  @override
  void initState() {
    developerlibs();
    super.initState();
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
              txt("Login.", 40.0, Colors.black, FontWeight.bold),
              sizebox(size.height / 80),
              textfild("email", email),
              sizebox(size.height / 80),
              textfild("Password", Password),
              sizebox(size.height / 50),
              textfild("passwordCheck", passwordCheck),
              sizebox(size.height / 50),
              textfild("first_name", first_name),
              sizebox(size.height / 50),
              textfild("last_name", last_name),
              sizebox(size.height / 50),
              textfild("username", username),
              sizebox(size.height / 50),
              textfild("phone_number", phone_number),
              sizebox(size.height / 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  txt("Already have an account? ", 15.0, Colors.black,
                      FontWeight.normal),
                  InkWell(
                    onTap: () {
                      // Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: txt(
                        "Sign up", 15.0, Color(0xffFFB61D), FontWeight.normal),
                  )
                ],
              ),
              sizebox(10),
              InkWell(
                onTap: developerlibs,
                // onTap: (){
                //   Navigator.push(context, MaterialPageRoute(builder: (context)=> Screen2()));
                // },
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
