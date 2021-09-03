import 'package:catalog_revision/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPagin extends StatefulWidget {
  const LoginPagin({Key? key}) : super(key: key);

  @override
  _LoginPaginState createState() => _LoginPaginState();
}

class _LoginPaginState extends State<LoginPagin> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, Routes.HomePageRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/login.png",
                    fit: BoxFit.contain,
                  ),
                  Center(
                    child: Text(
                      "Welcome $name",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                    child: Column(
                      children: [
                        TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) return "Username is empty";
                              return null;
                            },
                            onChanged: (value) {
                              name = value;
                              setState(() {});
                            },
                            decoration: InputDecoration(
                                hintText: "Enter username",
                                labelText: "Username")),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) return "Password is empty";
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "Enter password",
                                labelText: "Password"))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                    child: InkWell(
                      onTap: () => moveToHome(),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        child: Center(
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(color: Colors.white),
                                  )),
                        height: 40,
                        width: changeButton ? 50 : 100,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
