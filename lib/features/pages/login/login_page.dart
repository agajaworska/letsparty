import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:letsparty/features/cubit/root_cubit.dart';
import 'package:letsparty/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final textColor = Colors.grey.shade800;

  final colorizeColors = [
    const Color.fromARGB(255, 108, 188, 177),
    const Color.fromARGB(255, 192, 133, 234),
    const Color.fromARGB(255, 255, 251, 199),
    const Color.fromARGB(255, 249, 193, 195),
  ];

  final colorizeTextStyle = const TextStyle(
    fontFamily: 'Bebas',
    fontSize: 85,
    color: Color.fromARGB(238, 205, 125, 219),
    shadows: <Shadow>[
      Shadow(
        offset: Offset(4, 4),
        blurRadius: 2,
        color: Color.fromARGB(255, 7, 7, 6),
      ),
      Shadow(
        offset: Offset(-3, -3),
        blurRadius: 2.0,
        color: Color.fromARGB(255, 255, 251, 199),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit()..start(),
      child: BlocBuilder<RootCubit, RootState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 144, 222, 212),
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        AnimatedTextKit(
                          animatedTexts: [
                            ColorizeAnimatedText('Let\'s party!',
                                textStyle: colorizeTextStyle,
                                colors: colorizeColors,
                                speed: Duration(milliseconds: 350)),
                          ],
                          repeatForever: true,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: textFieldDecoration(
                          text: 'Email',
                          icon: const Icon(
                            Ionicons.text_outline,
                            color: Color.fromARGB(255, 249, 193, 195),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                      child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: textFieldDecoration(
                              text: 'Password',
                              icon: const Icon(
                                Ionicons.text_outline,
                                color: Color.fromARGB(255, 249, 193, 195),
                              ))),
                    ),
                    const SizedBox(height: 20),
                    Text(state.errorMessage),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () async {
                        if (state.isCreatingAccount) {
                          try {
                            context.read<RootCubit>().register(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                          } catch (error) {
                            state.errorMessage.toString();
                          }
                        } else {
                          try {
                            context.read<RootCubit>().signIn(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                          } catch (error) {
                            state.errorMessage.toString();
                          }
                        }
                      },
                      style: elevatedButtonStyle(),
                      child: Text(
                        state.isCreatingAccount
                            ? 'Register new account'
                            : 'Sign in',
                      ),
                    ),
                    const SizedBox(height: 15),
                    if (state.isCreatingAccount == false) ...[
                      TextButton(
                        onPressed: () {
                          context
                              .read<RootCubit>()
                              .createAccountButtonPressed();
                        },
                        child: Text('Create an account',
                            style: GoogleFonts.montserrat(
                              color: textColor,
                            )),
                      ),
                    ],
                    if (state.isCreatingAccount) ...[
                      TextButton(
                        onPressed: () {
                          context.read<RootCubit>().signInButtonPressed();
                        },
                        child: Text('Already have an account?',
                            style: GoogleFonts.montserrat(
                              color: textColor,
                            )),
                      ),
                    ],
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => PasswordAlertDialog(),
                            fullscreenDialog: true,
                          ),
                        );
                      },
                      child: Text('Forgot password?',
                          style: GoogleFonts.montserrat(
                            color: textColor,
                          )),
                    ),
                  ]),
            ),
          );
        },
      ),
    );
  }
}

class PasswordAlertDialog extends StatelessWidget {
  PasswordAlertDialog({
    Key? key,
  }) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit()..start(),
      child: BlocBuilder<RootCubit, RootState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 144, 222, 212),
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 144, 222, 212),
            ),
            body: const Center(
                child: AlertDialog(
              actions: [
                ForgotPasswordView(),
              ],
            )),
          );
        },
      ),
    );
  }
}
