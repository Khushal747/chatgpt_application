import 'package:flutter/material.dart';


import '../widgets/roundButton.dart';
import 'loginPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _emailError = '';
  String _phoneError = '';
  String _nameError = '';
  String _passwordError = '';

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _contactNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _genderContrloller = TextEditingController();

  String gender = 'Male';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
      ),
      body: SingleChildScrollView(
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _nameController,
                        decoration: const InputDecoration(
                          hintText: 'Name',
                        ),
                        onChanged: (value) {
                          setState(() {
                            if (value.isEmpty) {
                              _nameError = 'Please fill the field';
                            } else {
                              _nameError = '';
                            }
                          });
                        },
                      ),
                      if (_nameError != null)
                        Text(
                          _nameError,
                          style: TextStyle(color: Colors.red),
                        ),
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          // label: Text('Enter your email')

                          prefixIcon: Icon(Icons.email_outlined),
                          // label: Text('Enter email')
                        ),
                        onChanged: (value) {
                          setState(() {
                            if (value.isEmpty) {
                              _emailError = 'Please fill the field';
                            } else {
                              _emailError = '';
                            }
                          });
                        },
                      ),
                      if (_emailError != null)
                        Text(
                          _emailError,
                          style: TextStyle(color: Colors.red),
                        ),
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _contactNumberController,
                        decoration: const InputDecoration(
                          hintText: 'PhoneNumber',
                        ),
                        onChanged: (value) {
                          setState(() {
                            if (value.isEmpty) {
                              _phoneError = 'Please fill the field';
                            } else {
                              _phoneError = '';
                            }
                          });
                        },
                      ),
                      if (_phoneError != null)
                        Text(
                          _phoneError,
                          style: TextStyle(color: Colors.red),
                        ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: ' Password',
                        ),
                        onChanged: (value) {
                          setState(() {
                            if (value.isEmpty) {
                              _passwordError = 'Please fill the field';
                            } else {
                              _passwordError = '';
                            }
                          });
                        },
                      ),
                      if (_passwordError != null)
                        Text(
                          _passwordError,
                          style: TextStyle(color: Colors.red),
                        ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _confirmpasswordController,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: ' Confirm Password',
                        ),
                      ),
                      const SizedBox(height: 10),
                      DropdownButton(
                        value: gender,
                        items: const [
                          DropdownMenuItem(
                            child: Text('Female'),
                            value: 'Female',
                          ),
                          DropdownMenuItem(
                            child: Text('Male'),
                            value: 'Male',
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      RoundButton(
                        title: "SignUp",
                        ontap: () {
                          if (_passwordController.text ==
                              _confirmpasswordController.text) {
                            print("11111111111111111111");

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          } else {
                            print("hellllllllllllll");
                            // PasswordCheck();
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: const Text("Already Registered?"),
                      ),
                    ],
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
