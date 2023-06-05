import 'package:flutter/material.dart';

import 'registor.dart';
import 'namedata.dart';
import 'det.dart';
import 'list.dart';

void main() {
  runApp(const login(
    username: '',
  ));
}

class list extends StatelessWidget {
  String username;
  list({
    required this.username,
  });
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('wellcome:$username'),
      ),
      body: const login(
        username: '',
      ),
    );
  }
}

// ignore: camel_case_types

class login extends StatefulWidget {
  const login({
    super.key,
    required String username,
  });

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController username = TextEditingController();

  final TextEditingController password = TextEditingController();
  final TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              const Text(
                'registration form',
                style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                    fontSize: 50),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: username,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20, right: 20),
                      border: OutlineInputBorder(),
                      labelText: 'username',
                      hintText: 'Enter username'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your userName';
                    }
                    bool nameValidator =
                        RegExp(r"^[a-zA-Z ]+$").hasMatch(value);
                    if (!nameValidator) {
                      return "please enter a valied name";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: phone,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20, right: 20),
                      border: OutlineInputBorder(),
                      labelText: 'phone',
                      hintText: 'Enter phone no'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter phone number';
                    }
                    bool phoneValidator = RegExp(r"^[1-9]+$").hasMatch(value);
                    if (!phoneValidator) {
                      return " phone number in not valid";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20, right: 20),
                      border: OutlineInputBorder(),
                      labelText: 'email',
                      hintText: 'Enter your email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    bool emailValied = RegExp(
                            r"^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-zA-Z]{2,})$")
                        .hasMatch(value);
                    if (!emailValied) {
                      return "enter valied Email!";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  controller: password,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20, right: 20),
                      border: OutlineInputBorder(),
                      labelText: 'password',
                      hintText: 'Enter  password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20, right: 20),
                      border: OutlineInputBorder(),
                      labelText: 'gender',
                      hintText: 'Enter gender'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Your gender';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text('Forgot password?'),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => registor(
                                  username: username.text,
                                  password: password.text,
                                )),
                      );
                    }
                  },
                  child: const Text('registor'),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextButton(
              //     onPressed: () {
              //       if (_formKey.currentState!.validate()) {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => registor(
              //                   // name: _name.text,
              //                   )),
              //         );
              //       }
              //     },
              //     child: const Text('please login!!'),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
