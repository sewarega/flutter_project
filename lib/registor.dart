import 'package:flutter/material.dart';

import 'list.dart';
import 'login.dart';

void main() {
  runApp(const registor(
    password: '',
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
      body: const registor(
        username: '',
        password: '',
      ),
    );
  }
}

// ignore: camel_case_types
class registor extends StatefulWidget {
  final String username, password;
  const registor({
    super.key,
    required this.username,
    required this.password,
  });

  @override
  State<registor> createState() => _registorState(password, username);
}

// ignore: camel_case_types
class _registorState extends State<registor> {
  late String username, password;
  _registorState(this.username, this.password);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username1 = TextEditingController();

  final TextEditingController _password1 = TextEditingController();
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
                'login form',
                style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                    fontSize: 50),
              ),
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _username1,
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
                height: 15,
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
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _password1,
                  obscureText: true,
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
              const Text('Forgot password?'),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_username1.text == username &&
                          _password1.text == password) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => list(
                                    username: _username1.text,
                                  )),
                        );
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AlertDialog(
                                  title: Text(
                                    "Wrong entries",
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  content: Text(
                                      "please check your username and  password"));
                            });
                      }
                    }
                  },
                  child: const Text('login'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => login(
                                username: _username1.text,
                              )),
                    );
                    // }
                  },
                  child: const Text('create account?'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
