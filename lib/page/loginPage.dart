import 'package:aichat/page/signupPage.dart';
import 'package:flutter/material.dart';

import '../widgets/roundButton.dart';
import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String _emailError='';

  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoginPage"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                child: Image.asset('images/logo.png'),
              ),
            ),
            Card(
              child: Form(
                child: Column(
                  children: [

                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      onChanged: (value) {
                        setState(() {
                          if (value.isEmpty ) {
                            _emailError = 'Please enter a valid email address';
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


                    const SizedBox(height: 10,),


                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.password),
                      ),

                    ),

                    const SizedBox(height: 20),


                    RoundButton(
                      title: "SignIn",
                      ontap: () {
                        if (_emailController.text.isEmpty) {
                          setState(() {
                            _emailError = 'Please enter a valid email address';
                          });
                        } else if (_passwordController.text.isEmpty) {
                          setState(() {
                            _emailError = '';
                          });
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Error'),
                                content: const Text('Please enter password'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          // Constants.prefs?.setBool("isLogged", true);
// Constants.prefs?.setString("userName", _userNameController.text);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage()),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 10,),


                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                      },
                      child: const Text("Not Registered yet?"),
                    ),


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
