// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var isCreatingAccount = false;
  var errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 212, 208, 245),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'L E T \'S  P A R T Y',
                style: GoogleFonts.bebasNeue(
                    fontSize: 52,
                    color: const Color.fromARGB(255, 50, 5, 58),
                    textStyle: const TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(5.0, -5.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 222, 161, 253),
                        ),
                      ],
                    )),
              ),
              const SizedBox(height: 100),
              TextField(
                controller: widget.emailController,
                decoration: const InputDecoration(
                  hintText: 'E-mail',
                ),
              ),
              TextField(
                controller: widget.passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Hasło',
                ),
              ),
              const SizedBox(height: 25),
              Text(errorMessage),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (isCreatingAccount == true) {
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: widget.emailController.text,
                        password: widget.passwordController.text,
                      );
                    } catch (error) {
                      setState(() {
                        errorMessage = '${error}';
                      });
                    }
                  } else {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: widget.emailController.text,
                        password: widget.passwordController.text,
                      );
                    } catch (error) {
                      setState(() {
                        errorMessage = '${error}';
                      });
                    }
                  }
                },
                child: Text(
                  isCreatingAccount == true ? 'Zarejestruj się' : 'Zaloguj się',
                ),
              ),
              const SizedBox(height: 20),
              if (isCreatingAccount == false) ...[
                TextButton(
                  onPressed: () {
                    setState(() {
                      isCreatingAccount = true;
                    });
                  },
                  child: const Text('Utwórz konto'),
                ),
              ],
              if (isCreatingAccount == true) ...[
                TextButton(
                  onPressed: () {
                    setState(() {
                      isCreatingAccount = false;
                    });
                  },
                  child: const Text('Masz już konto?'),
                ),
              ],
            ]),
          ),
        ));
  }
}
